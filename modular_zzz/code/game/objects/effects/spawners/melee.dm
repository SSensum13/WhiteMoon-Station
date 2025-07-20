/obj/effect/spawner/random/melee
	name = "Random Melee Weapon"
	desc = "This is a random melee weapon."
	icon_state = "esword_dual"
	spawn_loot_count = 2

/obj/effect/spawner/random/melee/New(loc, ...)
	. = ..()
	LAZYADD(loot, typesof(/obj/item/melee))
	LAZYADD(loot, typesof(/obj/item/knife))
