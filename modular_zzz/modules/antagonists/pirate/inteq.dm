/datum/outfit/pirate/inteq
	name = "PMC InteQ: Pirate"

	uniform = /obj/item/clothing/under/syndicate/inteq_honorable_vanguard
	head = /obj/item/clothing/head/HoS/inteq_vanguard
	mask = /obj/item/clothing/mask/balaclava/breath/inteq
	gloves = /obj/item/clothing/gloves/combat
	suit = /obj/item/clothing/suit/armor/inteq

	back = /obj/item/storage/backpack/duffelbag/syndie
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	ears = /obj/item/radio/headset/inteq
	l_pocket = /obj/item/extinguisher/mini
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/medical,
		/obj/item/organ/eyes/robotic/shield,
		/obj/item/organ/cyberimp/chest/nutriment/plus,
	)

	implants = list(/obj/item/implant/deathrattle)

/datum/outfit/pirate/inteq/warlord
	name = "PMC InteQ: Pirate Leader"
	id_trim = /datum/id_trim/pirate/captain
	head = /obj/item/clothing/head/HoS/inteq_honorable_vanguard
	suit = /obj/item/clothing/suit/armor/inteq/honorable_vanguard

/obj/effect/mob_spawn/ghost_role/human/pirate/inteq
	name = "\improper InteQ sleeper"
	desc = "Продвинутое Спальное Место, от которого несёт запахом железа."
	density = FALSE
	you_are_text = "Ты был никем, пока тебе не дали возможность зарабатывать на убийствах. Если приложишь усилия, сможешь добиться успехов!"
	flavour_text = "Держитесь вместе и разграбьте станцию подчистую!"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	prompt_name = "a InteQ sleeper"
	outfit = /datum/outfit/pirate/inteq
	rank = "Mercenary"

/obj/effect/mob_spawn/ghost_role/human/pirate/inteq/warlord
	rank = "Vanguard"
	outfit = /datum/outfit/pirate/inteq/warlord

/obj/effect/mob_spawn/ghost_role/human/pirate/inteq/warlord/special(mob/living/carbon/spawned_mob)
	. = ..()
	spawned_mob.dna.add_mutation(/datum/mutation/hulk/superhuman, MUTATION_SOURCE_GHOST_ROLE)
	spawned_mob.dna.add_mutation(/datum/mutation/gigantism, MUTATION_SOURCE_GHOST_ROLE)

