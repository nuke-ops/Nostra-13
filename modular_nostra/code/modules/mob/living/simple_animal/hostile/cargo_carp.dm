/mob/living/simple_animal/hostile/carp/cargo
	name = "Jerry"
	desc = "He fish.\n\
			He cargo fish even."
	gender = FEMALE
	regen_amount = 8

	icon = 'modular_nostra/icons/mob/animal.dmi'
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
	aggro_vision_range = 0
	faction = list("neutral")
	AIStatus = 2
	butcher_results = list(/obj/item/toy/spinningtoy = 1,
							/obj/item/clothing/head/soft = 1)
