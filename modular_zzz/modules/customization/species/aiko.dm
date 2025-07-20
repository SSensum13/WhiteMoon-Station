/datum/species/aiko
	name = "Aiko"
	id = SPECIES_MAMMAL
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_LITERATE,
		TRAIT_MUTANT_COLORS,
		TRAIT_FAST_METABOLISM,
		TRAIT_HARD_SOLES,
		TRAIT_NIGHT_VISION,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_bodyparts = list()
	mutanttongue = /obj/item/organ/tongue/mammal
	species_language_holder = /datum/language_holder/vulpkanin
	payday_modifier = 1.25
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	examine_limb_id = SPECIES_MAMMAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/mutant,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/mutant,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/mutant,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/mutant,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/mutant,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/mutant,
	)

	meat = /obj/item/food/meat/slab/bear

/datum/species/vulpkanin/create_pref_unique_perks()
	var/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = "face-smile-beam",
		SPECIES_PERK_NAME = "Peanut Butter Affinity",
		SPECIES_PERK_DESC = "Vulpkanin LOVE peanutbutter and get quite excited when eating it",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = "shoe-prints",
		SPECIES_PERK_NAME = "Hardened Soles",
		SPECIES_PERK_DESC = "Vulpkanin have feet that can withstand more than most species",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = "eye",
		SPECIES_PERK_NAME = "Night Vision",
		SPECIES_PERK_DESC = "Vulpkanin eyes can see better in the dark than most species",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = "biohazard",
		SPECIES_PERK_NAME = "Chocolate Allergy",
		SPECIES_PERK_DESC = "Vulpkanin will start rapidly taking toxic damage when consuming coco",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = "stomach",
		SPECIES_PERK_NAME = "Hunger",
		SPECIES_PERK_DESC = "Vulpkanin will get hungry twice as fast as most species",
	))

	return to_add
/datum/species/vulpkanin/get_default_mutant_bodyparts()
	return list(
		"tail" = list("Fox (Alt 3)", TRUE),
		"snout" = list("Husky", TRUE),
		"horns" = list("None", FALSE),
		"ears" = list("Husky", TRUE),
		"legs" = list("Normal Legs", TRUE),
		"taur" = list("None", FALSE),
		"fluff" = list("None", FALSE),
		"wings" = list("None", FALSE),
		"head_acc" = list("None", FALSE),
		"neck_acc" = list("None", FALSE),
	)

/obj/item/organ/tongue/vulpkanin
	liked_foodtypes = RAW | MEAT
	disliked_foodtypes = CLOTH
	toxic_foodtypes = TOXIC


/datum/species/mammal/randomize_features()
	var/list/features = ..()
	features["mcolor"] = "#FFFFFF"
	features["mcolor2"] = "#FFFFFF"
	features["mcolor3"] = "#FFFFFF"
	return features

/datum/species/dullahan/get_species_description()
	return "Айко - множество антропоморфных волков и волчиц."

/datum/species/dullahan/get_species_lore()
	return "Род Айко состоит из Айко всех сортов. Пилоты, инженеры, \
	первоклассные офицеры, гениальные медики и лучшие специалисты в области науки. \
	Удачный эксперимент в области клонирования вышел на Торговую Арену и пользуется спросом по всевозможным направлениям."

/datum/species/vulpkanin/prepare_human_for_preview(mob/living/carbon/human/aiko)
	var/main_color = "#FF8800"
	var/second_color = "#FFFFFF"

	aiko.dna.features["mcolor"] = main_color
	aiko.dna.features["mcolor2"] = second_color
	aiko.dna.features["mcolor3"] = second_color
	aiko.dna.mutant_bodyparts["snout"] = list(MUTANT_INDEX_NAME = "Mammal, Long", MUTANT_INDEX_COLOR_LIST = list(main_color, main_color, main_color))
	aiko.dna.mutant_bodyparts["tail"] = list(MUTANT_INDEX_NAME = "Husky", MUTANT_INDEX_COLOR_LIST = list(second_color, main_color, main_color))
	aiko.dna.mutant_bodyparts["ears"] = list(MUTANT_INDEX_NAME = "Wolf", MUTANT_INDEX_COLOR_LIST = list(main_color, second_color, second_color))
	regenerate_organs(aiko, src, visual_only = TRUE)
	aiko.update_body(TRUE)
