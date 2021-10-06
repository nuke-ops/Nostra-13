#define BODY_PRESSURE_COMBO "DG"
#define EXPAND_COMBO "HGG"
#define SLUDGE_COMBO "GGH"
#define LOCKDOWN_COMBO "DHDH"

/datum/martial_art/goo_fu
	name = "Goo Fu"
	id = MARTIALART_GOOFU
	block_chance = 50
	allow_temp_override = FALSE
	help_verb = /mob/living/carbon/human/proc/goo_fu_help

/datum/martial_art/goo_fu/proc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(findtext(streak,BODY_PRESSURE_COMBO))
		streak = ""
		bodypressure(A,D)
		return TRUE
	if(findtext(streak,EXPAND_COMBO))
		streak = ""
		expand(A,D)
		return TRUE
	if(findtext(streak,SLUDGE_COMBO))
		streak = ""
		sludge(A,D)
		return TRUE
	if(findtext(streak,LOCKDOWN_COMBO))
		streak = ""
		lockdown(A,D)
		return TRUE
	return FALSE

//Body Pressure, coats the opponent in slime which rapidly hardens.
/datum/martial_art/goo_fu/proc/bodypressure(mob/living/carbon/human/A, mob/living/carbon/human/D)
	var/def_check = A.getarmor(BODY_ZONE_CHEST, "melee")
	if(A == current_target)
		return
	log_combat(A, D, "body pressure(Goo Fu)")
	D.visible_message("<span class='warning'>[A] coats [D] in slime!</span>", \
						"<span class='userdanger'>[A] coats you in slime!</span>")
	D.Stun(15)
	A.apply_damage (15, STAMINA, BODY_ZONE_CHEST, def_check)
	playsound(get_turf(D), 'sound/effects/blobattack.ogg', 50, 1, -1)

//Expand, making your throw back the opponent.
/datum/martial_art/goo_fu/proc/expand(mob/living/carbon/human/A, mob/living/carbon/human/D)
	var/def_check = D.getarmor(BODY_ZONE_CHEST, "melee")
	log_combat(A, D, "expand (Goo Fu)")
	D.visible_message("<span class='warning'>[A] expand there fist, slamming it into [D]'s chest!</span>", \
						"<span class='userdanger'>[A] slams there expanded fist into your chest!</span>")
	D.apply_damage(15, BURN, BODY_ZONE_CHEST, def_check)
	D.Knockdown(3)
	D.emote("flip")
	var/atom/throw_target = get_edge_target_turf(D, get_dir(D, get_step_away(D, A)))
	D.throw_at(throw_target, 9, 5,A)
	playsound(get_turf(D), 'sound/effects/blobattack.ogg', 50, 1, -1)

/*
Sludge, making you encase the opponent in slime causing a hard grapple.
*/
/datum/martial_art/goo_fu/proc/sludge(mob/living/carbon/human/A, mob/living/carbon/human/D)
	var/def_check = D.getarmor(BODY_ZONE_CHEST, "melee")
	if(A == current_target)
		return
	if(A.grab_state < GRAB_NECK)
		log_combat(A, D, "sludge (Goo Fu)")
		D.visible_message("<span class='warning'>[A] wraps there slime around [D]'s body!</span>", \
							"<span class='userdanger'>[A] grapples your body with slime!</span>")
		D.apply_damage (50, STAMINA, BODY_ZONE_CHEST, def_check)
		D.emote("gasp")
		D.grabbedby(A, 1)
		A.setGrabState(GRAB_NECK)
	else
		D.apply_damage (15, BURN, BODY_ZONE_CHEST, def_check)
		if(D.silent <= 5)
			D.silent = clamp(D.silent + 5, 0, 5)
		playsound(get_turf(D), 'sound/effects/blobattack.ogg', 50, 1, -1)


//Lockdown, like any slimm, pouncing onto the opponent while draining there lifeforce.
/datum/martial_art/goo_fu/proc/lockdown(mob/living/carbon/human/A, mob/living/carbon/human/D)
	var/def_check = D.getarmor(BODY_ZONE_CHEST, "melee")
	if(A == current_target)
		return
	log_combat(A, D, "Lockdown (Goo Fu)")
	if(A.pulling == D && A.grab_state >= GRAB_NECK || D.IsSleeping())
		D.visible_message("<span class='warning'>[A] grapples onto [D]!</span>", \
						"<span class='userdanger'>[A] grapples onto you!</span>")
		D.apply_damage(5, BURN, BODY_ZONE_HEAD, def_check)
		D.Knockdown(15) //Without knockdown target still stands up while T3 grabbed.
		D.Stun(5)
		D.emote("scream")
		A.buckle_mob(D, TRUE, TRUE, 90, 1, 0, TRUE)
		//if(D.adjustFireLoss <= 30)
		D.adjustFireLoss(rand(2, 3) * 1)
		D.reagents.add_reagent(/datum/reagent/blood/jellyblood, rand(10, 25))
	else
		D.Knockdown(10)

/datum/martial_art/goo_fu/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("H",D)
	var/latch = rand(1, 20)
	var/def_check = D.getarmor(BODY_ZONE_CHEST, "melee")
	D.apply_damage(rand(1, 3), BURN, BODY_ZONE_CHEST, def_check)
	playsound(get_turf(D), 'sound/effects/blobattack.ogg', 50, 1, -1)
	if(check_streak(A,D))
		return TRUE
	if(A == current_target)
		return FALSE
	else
		if(latch == 5)
			if(A.pulling == D && A.grab_state >= GRAB_PASSIVE)
				D.visible_message("<span class='warning'>[A] sears [D] chest!</span>", \
						"<span class='userdanger'>[A] sears your chest!</span>")
				D.apply_damage(rand(15, 20), BURN, BODY_ZONE_CHEST, def_check)
				playsound(get_turf(D), 'sound/weapons/sear.ogg', 50, 1, -1)
				D.reagents.add_reagent(/datum/reagent/blood/jellyblood, rand(2, 5))
				return FALSE
			else
				if(D.buckled)
					D.apply_damage(5, BURN, BODY_ZONE_CHEST, def_check)
					playsound(get_turf(D), 'sound/weapons/sear.ogg', 50, 1, -1)
					return FALSE
				else
					D.emote("scream")
					D.grabbedby(A, 1)
					D.apply_damage(5, BURN, BODY_ZONE_CHEST, def_check)
					A.setGrabState(GRAB_AGGRESSIVE)
					D.Knockdown(10)
					return FALSE

	return FALSE

/datum/martial_art/goo_fu/disarm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("D",D)
	if(check_streak(A,D))
		return TRUE
	return FALSE

/datum/martial_art/goo_fu/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("G",D)
	if(check_streak(A,D))
		return TRUE
	return FALSE

/mob/living/carbon/human/proc/goo_fu_help()
	set name = "Recall Ancient Slimes"
	set desc = "Remember the crude fighting style of Slimes."
	set category = "Goo Fu"

	to_chat(usr, "<b><i>Your body wobbles as you begin to remember...</i></b>")

	to_chat(usr, "<span class='notice'>Body Pressure</span>: Disarm, Grab. Stuns the opponent, allowing for a follow-up.")
	to_chat(usr, "<span class='notice'>Expand</span>: Harm, Grab, Grab. Throws the opponent back a good distance.")
	to_chat(usr, "<span class='notice'>Sludge</span>: Grab, Grab, Harm. Locks the opponent in a choke-hold.")
	to_chat(usr, "<span class='notice'>Lockdown</span>: Disarm, Harm, Disarm, Harm. Causes you to grapple onto the target, doing heavy burn damage over-time.")
