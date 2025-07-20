// /datum/species/aiko
// 	name = "Aiko"
// 	id = SPECIES_MAMMAL
// 	inherent_traits = list(
// 		TRAIT_ADVANCEDTOOLUSER,
// 		TRAIT_CAN_STRIP,
// 		TRAIT_LITERATE,
// 		TRAIT_MUTANT_COLORS,
// 		TRAIT_FAST_METABOLISM,
// 		TRAIT_HARD_SOLES,
// 		TRAIT_NIGHT_VISION,
// 		TRAIT_STRONG_GRABBER,
// 		TRAIT_EMPATH,
// 	)
// 	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
// 	mutant_bodyparts = list()
// 	mutanttongue = /obj/item/organ/tongue/mammal
// 	payday_modifier = 1.25
// 	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
// 	examine_limb_id = SPECIES_MAMMAL
// 	bodypart_overrides = list(
// 		BODY_ZONE_HEAD = /obj/item/bodypart/head/mutant,
// 		BODY_ZONE_CHEST = /obj/item/bodypart/chest/mutant,
// 		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/mutant,
// 		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/mutant,
// 		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/mutant,
// 		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/mutant,
// 	)
// 	meat = /obj/item/food/meat/slab/bear
// 	skinned_type = /obj/item/stack/sheet/animalhide/bear

// /datum/species/aiko/create_pref_unique_perks()
// 	var/list/to_add = list()

// 	to_add += list(list(
// 		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
// 		SPECIES_PERK_ICON = "heart",
// 		SPECIES_PERK_NAME = "Empathic Nature",
// 		SPECIES_PERK_DESC = "Aiko have a natural ability to understand and connect with others emotionally, making them excellent mediators and friends.",
// 	))

// 	to_add += list(list(
// 		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
// 		SPECIES_PERK_ICON = "eye",
// 		SPECIES_PERK_NAME = "Enhanced Night Vision",
// 		SPECIES_PERK_DESC = "Aiko eyes are adapted for low-light conditions, allowing them to see clearly in darkness.",
// 	))

// 	to_add += list(list(
// 		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
// 		SPECIES_PERK_ICON = "shoe-prints",
// 		SPECIES_PERK_NAME = "Hardened Soles",
// 		SPECIES_PERK_DESC = "Aiko have tough, calloused feet that can withstand rough terrain and hot surfaces.",
// 	))

// 	to_add += list(list(
// 		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
// 		SPECIES_PERK_ICON = "hand-fist",
// 		SPECIES_PERK_NAME = "Strong Grip",
// 		SPECIES_PERK_DESC = "Aiko have naturally strong hands and arms, making them excellent at climbing and holding onto things.",
// 	))

// 	to_add += list(list(
// 		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
// 		SPECIES_PERK_ICON = "stomach",
// 		SPECIES_PERK_NAME = "High Metabolism",
// 		SPECIES_PERK_DESC = "Aiko burn through energy quickly and need to eat more frequently than other species.",
// 	))

// 	to_add += list(list(
// 		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
// 		SPECIES_PERK_ICON = "biohazard",
// 		SPECIES_PERK_NAME = "Toxic Sensitivity",
// 		SPECIES_PERK_DESC = "Aiko are particularly sensitive to toxic substances and take more damage from them.",
// 	))

// 	to_add += list(list(
// 		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
// 		SPECIES_PERK_ICON = "tshirt",
// 		SPECIES_PERK_NAME = "Fabric Aversion",
// 		SPECIES_PERK_DESC = "Aiko find most fabrics uncomfortable and prefer not to wear clothing when possible.",
// 	))

// 	return to_add

// /datum/species/aiko/get_default_mutant_bodyparts()
// 	return list(
// 		"tail" = list("Fox (Alt 3)", TRUE),
// 		"snout" = list("Mammal, Short ALT 2", TRUE),
// 		"horns" = list("None", FALSE),
// 		"ears" = list("Fox", TRUE),
// 		"legs" = list("Digitigrade", TRUE),
// 		"taur" = list("None", FALSE),
// 		"fluff" = list("None", FALSE),
// 		"wings" = list("None", FALSE),
// 		"head_acc" = list("None", FALSE),
// 		"neck_acc" = list("None", FALSE),
// 		"breasts" = list("Large", TRUE),
// 	)

// /datum/species/aiko/randomize_features()
// 	var/list/features = ..()
// 	features["mcolor"] = "#FFFFBB"
// 	features["mcolor2"] = "#FFFFBB"
// 	features["mcolor3"] = "#FFFFBB"
// 	return features

// /datum/species/aiko/get_species_description()
// 	return "Айко - уникальная раса клонов из антропоморфных волков и волчиц, известная своей эмпатией, энергичностью и творческим подходом к жизни."

// /datum/species/aiko/get_species_lore()
// 	return "Род Айко представляет собой особую ветвь антропоморфных лис, возникшую в результате успешного эксперимента по клонированию. \
// 	Эти существа отличаются необычайной эмпатией и способностью к эмоциональному сопереживанию, что делает их отличными медиаторами \
// 	и верными друзьями. Айко известны своим идеалистическим подходом к жизни, творческим мышлением и свободолюбивым духом. \
// 	Они часто находят себя в ролях, требующих понимания человеческой природы - от медиков и психологов до дипломатов и лидеров. \
// 	Несмотря на свою чувствительность, Айко обладают внутренней силой и мужеством, которые позволяют им преодолевать любые трудности."

// /datum/species/aiko/prepare_human_for_preview(mob/living/carbon/human/aiko)
// 	var/main_color = "#FFFFBB"
// 	var/second_color = "#FFCCCC"
// 	var/accent_color = "#FFEEDD"

// 	aiko.dna.features["mcolor"] = main_color
// 	aiko.dna.features["mcolor2"] = main_color
// 	aiko.dna.features["mcolor3"] = main_color

// 	aiko.dna.mutant_bodyparts["snout"] = list(MUTANT_INDEX_NAME = "Mammal, Short ALT 2", MUTANT_INDEX_COLOR_LIST = list(main_color, second_color, accent_color))
// 	aiko.dna.mutant_bodyparts["tail"] = list(MUTANT_INDEX_NAME = "Fox (Alt 3)", MUTANT_INDEX_COLOR_LIST = list(main_color, second_color, accent_color))
// 	aiko.dna.mutant_bodyparts["ears"] = list(MUTANT_INDEX_NAME = "Fox", MUTANT_INDEX_COLOR_LIST = list(main_color, second_color, accent_color))

// 	regenerate_organs(aiko, src, visual_only = TRUE)
// 	aiko.update_body(TRUE)

// /datum/language_holder/aiko
// 	understood_languages = list(
// 		/datum/language/common = list(LANGUAGE_ATOM),
// 		/datum/language/canilunzt = list(LANGUAGE_ATOM),
// 	)
// 	spoken_languages = list(
// 		/datum/language/common = list(LANGUAGE_ATOM),
// 		/datum/language/canilunzt = list(LANGUAGE_ATOM),
// 	)
