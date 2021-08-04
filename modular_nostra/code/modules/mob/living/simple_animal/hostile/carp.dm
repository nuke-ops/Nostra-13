/mob/living/simple_animal/hostile/carp/cargo
	name = "Jerry"
	desc = "He fish.\n\
			He cargo fish even."
	gender = FEMALE
	regen_amount = 8

	icon = 'icons/mob/animal.dmi'
	icon_state = "carp_cargo"
	icon_living = "carp_cargo"
	icon_dead = "carp_dead_cargo"
	icon_gib = "carp_gib_cargo"

	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	gold_core_spawnable = FRIENDLY_SPAWN
	melee_damage_lower = 18
	melee_damage_upper = 18
	health = 100
	maxHealth = 100
	speed = 10
	glide_size = 2

	faction = list("neutral", "carp")
	AIStatus = 4
	butcher_results = list(/obj/item/toy/spinningtoy = 1)
