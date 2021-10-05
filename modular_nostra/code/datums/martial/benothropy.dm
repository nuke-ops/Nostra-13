//I mean this makes sense, plus I have nerfed the shit out of this Beno.
/obj/effect/proc_holder/spell/targeted/shapeshift/benothropy
	name = "Xenothropy"
	desc = "You feel your ancestors calling to you..."
	invocation = "SSSSS!"
	action_icon = 'modular_nostra/icons/obj/actions_spells.dmi'
	action_icon_state = "shapeshift_xeno"
	action_background_icon_state = "bg_alien"
	revert_on_death = TRUE
	die_with_shapeshifted_form = FALSE

	shapeshift_type = /mob/living/carbon/alien/humanoid/royal/praetorian_beno

/obj/effect/proc_holder/spell/targeted/shapeshift/benothropy/cast(list/targets,mob/user = usr)
	if(!isxenoperson(user) && !isalien(user))
		to_chat(user, "<span class='warning'>You lack the genes to take an ancestorial state!</span>")
		return
	playsound(get_turf(user), 'modular_nostra/sound/effects/transformation_hiss.ogg', 50, 1, -1)
	if(src in user.mob_spell_list)
		user.mob_spell_list.Remove(src)
		user.mind.AddSpell(src)
	if(user.buckled)
		user.buckled.unbuckle_mob(src,force=TRUE)
	for(var/mob/living/M in targets)
		if(!shapeshift_type)
			var/list/animal_list = list()
			for(var/path in possible_shapes)
				var/mob/living/simple_animal/A = path
				animal_list[initial(A.name)] = path
			var/new_shapeshift_type = input(M, "Choose Your Animal Form!", "It's Morphing Time!", null) as null|anything in animal_list
			if(shapeshift_type)
				return
			shapeshift_type = new_shapeshift_type
			if(!shapeshift_type) //If you aren't gonna decide I am!
				shapeshift_type = pick(animal_list)
			shapeshift_type = animal_list[shapeshift_type]

		var/obj/shapeshift_holder/S = locate() in M
		if(S)
			Restore(M)
		else
			Shapeshift(M)

/mob/living/carbon/alien/humanoid/royal/praetorian_beno
	name = "spirit of the ancestor"
	caste = "p"
	maxHealth = 200
	health = 200
	icon_state = "alienp"
	meleeSlashHumanPower = 15
	sight = SEE_SELF
	meleeKnockdownPower = 100
	can_ventcrawl = FALSE
	meleeSlashSAPower = 30
	unique_name = 0
	isbenothropy = TRUE

/mob/living/carbon/alien/humanoid/royal/praetorian_beno/Initialize()
	//add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier, multiplicative_slowdown = 2.2)
	cached_multiplicative_slowdown = 1.5
	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/repulse/xenothropy(src))
	. = ..()

/obj/item/xenothropy
	name = "Xenothropy Injector"
	desc = "A serum allowing Xenomorph Hybrids to call upon there ancestors."
	icon = 'modular_nostra/icons/obj/library.dmi'
	icon_state = "xenothropy"
	w_class = 2

/obj/item/xenothropy/attack_self(mob/living/carbon/M)
	if(isxenoperson(M))
		to_chat(M, "You inject yourself with the syringe... You feel your ancestors calling for you.")
		M.xenothropize()
		qdel(src)
	else
		to_chat(M, "This might go badly for you...")

/mob/living/carbon/proc/xenothropize()
	AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/benothropy(src))
	return

/obj/effect/proc_holder/spell/aoe_turf/repulse/xenothropy
	name = "Tail Sweep"
	desc = "Throw back attackers with a sweep of your tail."
	sound = 'sound/magic/tail_swing.ogg'
	charge_max = 400 //Longer cooldown for tail swing.
	clothes_req = NONE
	antimagic_allowed = TRUE
	range = 2
	cooldown_min = 400 //Much longer cooldown.
	invocation_type = "none"
	sparkle_path = /obj/effect/temp_visual/dir_setting/tailsweep
	action_icon = 'icons/mob/actions/actions_xeno.dmi'
	action_icon_state = "tailsweep"
	action_background_icon_state = "bg_alien"
	anti_magic_check = FALSE

/obj/effect/proc_holder/spell/aoe_turf/repulse/xenothropy/cast(list/targets,mob/user = usr)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		playsound(C.loc, 'sound/voice/hiss5.ogg', 80, 1, 1)
		C.spin(6,1)
	..(targets, user, 60)
