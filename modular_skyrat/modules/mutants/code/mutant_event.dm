/datum/round_event_control/mutant_infestation //Admin only
	name = "HNZ-1 Pathogen Outbreak"
	typepath = /datum/round_event/mutant_infestation
	weight = 0

/datum/round_event/mutant_infestation
	announce_when = 300
	announce_chance = 100
	fakeable = TRUE
	var/infected = 1

/datum/round_event/mutant_infestation/setup()
	. = ..()
	infected = rand(6, 9)

/datum/round_event/mutant_infestation/start()
	. = ..()
	var/infectees = 0
	for(var/mob/living/carbon/human/iterating_human in shuffle(GLOB.player_list))
		if(!is_station_level(iterating_human.z))
			continue
		if(infectees >= infected)
			break
		if(try_to_mutant_infect(iterating_human, TRUE))
			infectees++
			notify_ghosts("[iterating_human] has been infected by the HNZ-1 pathogen!",
				source = iterating_human,
			)

/datum/round_event/mutant_infestation/announce(fake)
	alert_sound_to_playing(sound('modular_skyrat/modules/alerts/sound/alerts/alert2.ogg'), override_volume = TRUE)
	priority_announce("Автоматизированные системы фильтрации воздуха выявили неизвестный патоген в вентиляционных системах станции, введён карантин.", "Первый Уровень Биологической Угрозы", ANNOUNCER_MUTANTS)
