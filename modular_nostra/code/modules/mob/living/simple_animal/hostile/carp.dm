/mob/living/simple_animal/hostile/carp/cargo
	name = "Jerry"
	desc = "He fish.\n\
			He cargo fish even."
	gender = FEMALE

	icon = 'modular_nostra/icons/mob/animal.dmi'
	icon_state = "cargo_carp"
	icon_living = "cargo_carp"
	icon_dead = "cargo_carp_dead"
	icon_gib = "cargo_carp_gib"

	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	gold_core_spawnable = FRIENDLY_SPAWN
	melee_damage_lower = 18
	melee_damage_upper = 18
	health = 100
	maxHealth = 100
	turns_per_move = 5
	speed = 10
	movement_type = FLYING
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/weapons/bite.ogg'
	minbodytemp = 0
	maxbodytemp = 1500
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	faction = list("neutral", "carp")
	AIStatus = 2
	butcher_results = list(/obj/item/reagent_containers/food/snacks/carpmeat = 2,
							/obj/item/clothing/head/soft = 1)
