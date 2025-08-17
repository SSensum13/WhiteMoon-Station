/**
 * Maximum number of custom emotes that can be saved per character
 */
#define TGUI_PANEL_MAX_EMOTES 45

#define TGUI_PANEL_MAX_EMOTE_LENGTH 128
#define TGUI_PANEL_MAX_EMOTE_NAME_LENGTH 32
#define SHORT_EMOTE_MAX_LENGTH 40
#define CUSTOM_SHORT_EMOTE_COOLDOWN 0.8 SECONDS
#define CUSTOM_EMOTE_COOLDOWN 1.7 SECONDS

/*
	Панель эмоутов была переделана, и теперь вместо простого ассоциативного списка `emotes["sigh"] = "вздох"`
	у нас будет один из вариантов:
	 * `emotes["вздох"] = list("type" = 1, "key" = "sigh")`
 	 * `emotes["вздох"] = list("type" = 2, "key" = "sigh", "message_override" = "круто по-кастомну вздыхает")`
	 * `emotes["вздох"] = list("type" = 3, "message" = "круто по-кастомну вздыхает")`
	Где 1, 2 и 3 - TGUI_PANEL_EMOTE_TYPE_DEFAULT, TGUI_PANEL_EMOTE_TYPE_CUSTOM и TGUI_PANEL_EMOTE_TYPE_ME соответственно.
	В чём отличие между вторым и третьим вариантом? Во втором варианте всё ещё будет звук от "sigh". Особенно актуально в
	случае эмоутов с особыми эффектами (щелчками, маниакальным смехом и т.д.)

	Если ты меняешь эту схему, не забудь сделать миграцию в code/modules/client/preferences_savefile.dm.

	Стоит заметить, что all_emotes под это всё не подпадает и всё ещё является ассоциативным списком
	 * all_emotes["sigh"] = объект класса /datum/emote/sound/human/sigh
*/


/datum/tgui_panel
	/// Static list of all available emotes
	var/static/list/all_emotes = list()

/**
 * Initialize list of all available emotes with their keys
 * Called on New()
 */
/datum/tgui_panel/proc/populate_all_emotes_list()
	for(var/path in subtypesof(/datum/emote))
		var/datum/emote/E = new path()
		if(E.key)
			all_emotes[E.key] = E

/datum/tgui_panel/New(client/client)
	. = ..()
	if(!all_emotes.len)
		populate_all_emotes_list()

/**
 * Creates a new custom emote entry
 *
 * Arguments:
 * * emote_name - The display name for the
 * * emote - list with the emote content and type. See comment in the beggining of
 * `modular_zzplurt\code\modules\tgui_custom_emote_panel\topic.dm` for more information.
 *
 * Returns TRUE on success, FALSE on failure
 */
/datum/tgui_panel/proc/emotes_create(emote_name, emote)
	if (length(client.prefs.custom_emote_panel) > TGUI_PANEL_MAX_EMOTES)
		to_chat(client, span_warning("Maximum number of emotes reached: [TGUI_PANEL_MAX_EMOTES]"))
		return FALSE

	client.prefs.custom_emote_panel[emote_name] = emote
	client.prefs.save_custom_emotes()
	return TRUE

/**
 * Removes an existing custom emote entry
 *
 * Arguments:
 * * emote_name - The name of the emote
 *
 * Returns TRUE on success, FALSE on cancellation
 */
/datum/tgui_panel/proc/emotes_remove(emote_name)
	var/confirmation = tgui_alert(client.mob, "Вы уверены что хотите удалить эмоцию \"[emote_name]\" из панели?", "Подтверждение", list("Удалить", "Отмена"))
	if (confirmation != "Удалить")
		return FALSE

	client.prefs.custom_emote_panel.Remove(emote_name)

	return TRUE


/**
 * Renames an existing custom emote entry
 *
 * Arguments:
 * * emote_name - The name of the emote to rename
 *
 * Returns TRUE on success, FALSE on cancellation
 */
/datum/tgui_panel/proc/emotes_rename(emote_name)
	var/new_emote_name = tgui_input_text(client.mob, "Выберите новое название эмоции [emote_name]:", "Название эмоции", emote_name, TGUI_PANEL_MAX_EMOTE_NAME_LENGTH, FALSE, TRUE)
	if (!new_emote_name)
		return FALSE
	if (new_emote_name == emote_name)
		to_chat(client, span_notice("Переименование отменено"))
		return
	if (new_emote_name in client.prefs.custom_emote_panel)
		to_chat(client, span_warning("Эмоция \"[new_emote_name]\" уже существует!"))
		return

	var/list/emote = client.prefs.custom_emote_panel[emote_name]
	client.prefs.custom_emote_panel[new_emote_name] = emote
	client.prefs.custom_emote_panel.Remove(emote_name)

	return TRUE

/**
 * Attaches custom text to basic emotes
 *
 * Arguments:
 * * emote_name - The name of the emote to attach
 *
 * Returns TRUE on success, FALSE on cancellation
 */
/datum/tgui_panel/proc/emotes_add_custom_text(emote_name)
	if (isnull(client.prefs.custom_emote_panel[emote_name]))
		to_chat(client, span_warning("Эмоции [emote_name] нет в вашей панели!"))
		return FALSE

	var/emote_type = client.prefs.custom_emote_panel[emote_name]["type"]
	if (emote_type != TGUI_PANEL_EMOTE_TYPE_DEFAULT)
		to_chat(client, span_warning("Вы можете добавить текст только обычным эмоциям!"))
		return FALSE

	var/message_override = tgui_input_text(client.mob, "Выберите новый кастомный текст для эмоции [emote_name]:", "Кастомный текст", "", TGUI_PANEL_MAX_EMOTE_LENGTH, TRUE, TRUE)
	if (!message_override)
		return FALSE
	client.prefs.custom_emote_panel[emote_name]["type"] = TGUI_PANEL_EMOTE_TYPE_CUSTOM
	client.prefs.custom_emote_panel[emote_name]["message_override"] = message_override

	return TRUE

/**
 * Changes custom text of 'custom' and 'me' emotes
 *
 * Arguments:
 * * emote_name - The name of the emote to attach
 *
 * Returns TRUE on success, FALSE on cancellation
 */
/datum/tgui_panel/proc/emotes_change_custom_text(emote_name)
	if (isnull(client.prefs.custom_emote_panel[emote_name]))
		to_chat(client, span_warning("Эмоции [emote_name] нет в вашей панели!"))
		return FALSE

	var/emote_type = client.prefs.custom_emote_panel[emote_name]["type"]
	var/old_message = "???"
	if (emote_type == TGUI_PANEL_EMOTE_TYPE_CUSTOM)
		old_message = client.prefs.custom_emote_panel[emote_name]["message_override"]
	else if (emote_type == TGUI_PANEL_EMOTE_TYPE_ME)
		old_message = client.prefs.custom_emote_panel[emote_name]["message"]
	else
		to_chat(client, span_warning("У этой эмоции ещё нет кастомного текста!"))
		return FALSE

	var/message_override = tgui_input_text(client.mob, "Выберите новый кастомный текст для эмоции [emote_name]:", "Кастомный текст", old_message, TGUI_PANEL_MAX_EMOTE_LENGTH, TRUE, TRUE)
	if (!message_override)
		return TRUE
	if (emote_type == TGUI_PANEL_EMOTE_TYPE_CUSTOM)
		client.prefs.custom_emote_panel[emote_name]["message_override"] = message_override
	else
		client.prefs.custom_emote_panel[emote_name]["message"] = message_override

	return TRUE

/**
 * Sends the current list of custom emotes to the UI
 */
/datum/tgui_panel/proc/emotes_send_list()
	if(!client?.prefs)
		return
	var/list/payload = client.prefs.custom_emote_panel
	if(!payload)
		payload = list()
		client.prefs.custom_emote_panel = payload
	window.send_message("emotes/setList", payload)

/datum/tgui_panel/on_message(type, payload)
	. = ..()

	if (!client?.prefs)
		return

	if (. && type == "ready")
		emotes_send_list()

	if (.)
		return

	switch (type)
		if ("emotes/execute")
			if (!islist(payload))
				return

			var/emote_name = payload["name"]
			if (!emote_name || !istext(emote_name) || !length(emote_name))
				return

			// Я не уверен что нужно ограничивать юзера панелькой,
			// но те кто знают JavaScript, смогут спамить эмоциями
			// даже теми, которых в панели нет, если не будет этой
			// проверки здесь
			if (isnull(client.prefs.custom_emote_panel[emote_name]))
				to_chat(client, span_warning("Эмоции [emote_name] нет в вашей панели!"))
				return FALSE
			if (!islist(client.prefs.custom_emote_panel[emote_name]))
				to_chat(client, span_warning("Эмоция повреждена!"))
				return FALSE
			if (isnull(client.prefs.custom_emote_panel[emote_name]["type"]))
				to_chat(client, span_warning("Эмоция [emote_name] не имеет типа!"))
				return FALSE
			var/emote_type = client.prefs.custom_emote_panel[emote_name]["type"]

			if (!isliving(client.mob))
				return TRUE
			var/mob/living/L = client.mob

			switch (emote_type)
				if (TGUI_PANEL_EMOTE_TYPE_DEFAULT)
					var/emote_key = client.prefs.custom_emote_panel[emote_name]["key"]
					L.emote(emote_key, intentional = TRUE)

				// Чтобы люди не спамили пастами из 128 символов со скоростью света
				if (TGUI_PANEL_EMOTE_TYPE_CUSTOM)
					if(!TIMER_COOLDOWN_FINISHED(L, "general_emote_audio_cooldown"))
						to_chat(L, span_warning("Не так быстро!"))
						return TRUE
					var/emote_key = client.prefs.custom_emote_panel[emote_name]["key"]
					var/message_override = client.prefs.custom_emote_panel[emote_name]["message_override"]
					L.emote(emote_key, message_override = message_override, intentional = TRUE)
					if (length_char(message_override) < SHORT_EMOTE_MAX_LENGTH)
						TIMER_COOLDOWN_START(L, "general_emote_audio_cooldown", CUSTOM_SHORT_EMOTE_COOLDOWN)
					else
						TIMER_COOLDOWN_START(L, "general_emote_audio_cooldown", CUSTOM_EMOTE_COOLDOWN)

				if (TGUI_PANEL_EMOTE_TYPE_ME)
					if(!TIMER_COOLDOWN_FINISHED(L, "general_emote_audio_cooldown"))
						to_chat(L, span_warning("Не так быстро!"))
						return TRUE
					var/message = client.prefs.custom_emote_panel[emote_name]["message"]
					L.emote("me", message = message, intentional = TRUE)
					if (length_char(message) < SHORT_EMOTE_MAX_LENGTH)
						TIMER_COOLDOWN_START(L, "general_emote_audio_cooldown", CUSTOM_SHORT_EMOTE_COOLDOWN)
					else
						TIMER_COOLDOWN_START(L, "general_emote_audio_cooldown", CUSTOM_EMOTE_COOLDOWN)

			return TRUE

		if ("emotes/create")
			if (length(client.prefs.custom_emote_panel) > TGUI_PANEL_MAX_EMOTES)
				to_chat(client, span_warning("Maximum number of emotes reached: [TGUI_PANEL_MAX_EMOTES]"))
				return FALSE

			var/list/emote = list()

			var/emote_type_string = tgui_alert(client.mob, "Какую эмоцию добавить в панель?", "Выбор типа эмоции", list("Обычная", "С кастомным текстом", "*me"))
			if (!emote_type_string)
				to_chat(client, span_warning("Добавление эмоции отменено."))
				return

			var/suggested_name = ""
			switch (emote_type_string)
				if ("Обычная")
					var/emote_key = tgui_input_list(client.mob, "Какую эмоцию добавить в панель?", "Выбор эмоции", all_emotes)
					if (!emote_key)
						to_chat(client, span_warning("Добавление эмоции отменено."))
						return

					if (!(emote_key in all_emotes))
						to_chat(client, span_warning("Эмоция [emote_key] не существует!"))
						return

					suggested_name = emote_key
					emote = list(
						"type" = TGUI_PANEL_EMOTE_TYPE_DEFAULT,
						"key" = emote_key,
					)

				if ("С кастомным текстом")
					var/emote_key = tgui_input_list(client.mob, "Какую эмоцию добавить в панель?", "Выбор эмоции", all_emotes)
					if (!emote_key)
						to_chat(client, span_warning("Добавление эмоции отменено."))
						return

					if (!(emote_key in all_emotes))
						to_chat(client, span_warning("Эмоция [emote_key] не существует!"))
						return

					var/message_override = tgui_input_text(client.mob, "Какой кастомный текст будет у эмоции? (максимум - [TGUI_PANEL_MAX_EMOTE_LENGTH] символов)", "Кастомный текст", emote_key, TGUI_PANEL_MAX_EMOTE_LENGTH, TRUE, TRUE)
					if (!message_override)
						to_chat(client, span_warning("Текст \"[message_override]\" не подходит!"))
						return

					suggested_name = emote_key
					emote = list(
						"type" = TGUI_PANEL_EMOTE_TYPE_CUSTOM,
						"key" = emote_key,
						"message_override" = message_override,
					)

				if ("*me")
					var/message = tgui_input_text(client.mob, "Какой текст будет у эмоции? (максимум - [TGUI_PANEL_MAX_EMOTE_LENGTH] символов)", "Кастомный текст", "", TGUI_PANEL_MAX_EMOTE_LENGTH, TRUE, TRUE)
					if (!message)
						to_chat(client, span_warning("Текст \"[message]\" не подходит!"))
						return

					suggested_name = copytext_char(message, 1, TGUI_PANEL_MAX_EMOTE_NAME_LENGTH + 1)
					emote = list(
						"type" = TGUI_PANEL_EMOTE_TYPE_ME,
						"message" = message,
					)

			var/emote_name = tgui_input_text(client.mob, "Какое название эмоции будет в панели?", "Название эмоции", suggested_name, TGUI_PANEL_MAX_EMOTE_NAME_LENGTH, FALSE, TRUE)
			if (!emote_name)
				to_chat(client, span_warning("Название \"[emote_name]\" не подходит!"))
				return
			if (emote_name in client.prefs.custom_emote_panel)
				to_chat(client, span_warning("Эмоция \"[emote_name]\" уже существует!"))
				return

			if(emotes_create(emote_name, emote))
				emotes_send_list()
			return TRUE

		if ("emotes/contextAction")
			if (!islist(payload))
				return

			var/emote_name = payload["name"]
			if (!emote_name || !istext(emote_name) || !length(emote_name))
				return

			if (isnull(client.prefs.custom_emote_panel[emote_name]))
				to_chat(client, span_warning("Эмоции [emote_name] нет в вашей панели!"))
				return FALSE
			var/emote_type
			if (payload["is_broken"] || !islist(client.prefs.custom_emote_panel[emote_name]	))
				emote_type = TGUI_PANEL_EMOTE_TYPE_BROKEN
			else
				emote_type = client.prefs.custom_emote_panel[emote_name]["type"] ? client.prefs.custom_emote_panel[emote_name]["type"] : TGUI_PANEL_EMOTE_TYPE_BROKEN

			var/list/actions = list()
			switch (emote_type)
				if (TGUI_PANEL_EMOTE_TYPE_DEFAULT)
					actions.Add(list("Переименовать", "Кастомизировать", "Удалить"))

				if (TGUI_PANEL_EMOTE_TYPE_CUSTOM)
					actions.Add(list("Переименовать", "Изменить текст", "Удалить"))

				if (TGUI_PANEL_EMOTE_TYPE_ME)
					actions.Add(list("Переименовать", "Изменить текст", "Удалить"))

				if (TGUI_PANEL_EMOTE_TYPE_BROKEN)
					to_chat(client, span_warning("Запись повреждена, поэтому её можно только удалить."))
					actions.Add(list("Удалить"))

			var/action = tgui_alert(client.mob, "Что вы хотите сделать с эмоцией \"[emote_name]\"?", "Выбор действия", actions)

			switch (action)
				if ("Удалить")
					if (emotes_remove(emote_name))
						emotes_send_list()
				if ("Переименовать")
					if (emotes_rename(emote_name))
						emotes_send_list()
				if ("Кастомизировать")
					if (emotes_add_custom_text(emote_name))
						emotes_send_list()
				if ("Изменить текст")
					if (emotes_change_custom_text(emote_name))
						emotes_send_list()

			return TRUE



#undef TGUI_PANEL_MAX_EMOTES
#undef TGUI_PANEL_MAX_EMOTE_LENGTH
#undef TGUI_PANEL_MAX_EMOTE_NAME_LENGTH
#undef SHORT_EMOTE_MAX_LENGTH
#undef CUSTOM_SHORT_EMOTE_COOLDOWN
#undef CUSTOM_EMOTE_COOLDOWN
