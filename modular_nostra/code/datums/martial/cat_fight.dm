#define BALL_SMASHER_COMBO "GHH"
#define FELINE_INSTINCTS_COMBO "DD"
#define SWIFT_SWIPES_COMBO "DHG"
#define NYA_COMBO "DHHDGGG"

/datum/martial_art/cat_fight
	name = "cat fighting"
	streak = ""
	max_streak_length = 7
	id = MARTIALART_CATFIGHT //ID, used by mind/has_martialartcode\game\objects\items\granters.dm:345:error: user.mind.has_martialart: undefined proccode\game\objects\items\granters.dm:345:error: user.mind.has_martialart: undefined proccode\game\objects\items\granters.dm:345:error: user.mind.has_martialart: undefined proccode\game\objects\items\granters.dm:345:error: user.mind.has_martialart: undefined proccode\game\objects\items\granters.dm:345:error: user.mind.has_martialart: undefined proc
	block_chance = 10 //Chance to block melee attacks using items while on throw mode.
	restraining = 1 //used in cqc's disarm_act to check if the disarmed is being restrained and so whether they should be put in a chokehold or not
	help_verb = /mob/living/carbon/human/proc/nya_help
	allow_temp_override = FALSE

/datum/martial_art/cat_fight/proc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(findtext(streak,BALL_SMASHER_COMBO))
		streak = ""
		ballsmasher(A,D)
		return TRUE
	if(findtext(streak,FELINE_INSTINCTS_COMBO))
		streak = ""
		felineinstinct(A,D)
		return TRUE
	if(findtext(streak,SWIFT_SWIPES_COMBO))
		streak = ""
		swiftswipes(A,D)
		return TRUE
	if(findtext(streak,NYA_COMBO))
		streak = ""
		nya(A,D)
		return TRUE
	return FALSE

//Tail Sweep, triggers an effect similar to Space Dragon's tail sweep but only affects stuff 1 tile next to you, basically 3x3.
/datum/martial_art/cat_fight/proc/nya(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(A == current_target)
		return
	log_combat(A, D, "nya~(cat fight)")
	D.visible_message("<span class='warning'>[A] grabs [D]'s crotch!</span>", \
						"<span class='userdanger'>[A] grabs your crotch, you have an irresistible urge to say Nya~!</span>")
	D.set_species(/datum/species/human/felinid)
	D.emote("nya")
	D.Knockdown(1)
	ADD_TRAIT(D, TRAIT_PACIFISM, "status_effect")
	D.update_body()
	D.update_hair()
	D.update_body_parts()
	D.update_mutations_overlay()
	playsound(get_turf(D), 'sound/voice/catpeople/nyahaha1.ogg', 50, 1, -1)

//Face Scratch, deals 10 brute to head(reduced by armor), blurs the target's vision and gives them the confused effect for a short time.
/datum/martial_art/cat_fight/proc/swiftswipes(mob/living/carbon/human/A, mob/living/carbon/human/D)
	var/def_check = D.getarmor(BODY_ZONE_HEAD, "melee")
	log_combat(A, D, "swift swipes (cat fight)")
	D.visible_message("<span class='warning'>[A] scratches [D]'s face!</span>", \
						"<span class='userdanger'>[A] scratches your face!</span>")
	D.apply_damage(rand(2,9), BRUTE, BODY_ZONE_HEAD, def_check)
	A.do_attack_animation(D, ATTACK_EFFECT_CLAW)
	sleep(3)
	log_combat(A, D, "swift swipes (cat fight)")
	D.visible_message("<span class='warning'>[A] scratches [D]'s face!</span>", \
						"<span class='userdanger'>[A] scratches your face!</span>")
	D.apply_damage(rand(2,9), BRUTE, BODY_ZONE_HEAD, def_check)
	A.do_attack_animation(D, ATTACK_EFFECT_CLAW)
	playsound(get_turf(D), 'sound/weapons/slash.ogg', 50, 1, -1)
	sleep(3)
	log_combat(A, D, "swift swipes (cat fight)")
	D.visible_message("<span class='warning'>[A] scratches [D]'s face!</span>", \
						"<span class='userdanger'>[A] scratches your face!</span>")
	D.apply_damage(rand(2,9), BRUTE, BODY_ZONE_HEAD, def_check)
	A.do_attack_animation(D, ATTACK_EFFECT_CLAW)
	var/atom/throw_target = get_edge_target_turf(D, get_dir(D, get_step_away(D, A)))
	D.throw_at(throw_target, 4, 2,A)
	playsound(get_turf(D), 'sound/misc/catscream.ogg', 50, 1, -1)

/*
Feline Instinct, causes massive eye damage while also disorientating the target.
*/
/datum/martial_art/cat_fight/proc/felineinstinct(mob/living/carbon/human/A, mob/living/carbon/human/D)
	var/def_check = D.getarmor(BODY_ZONE_HEAD, "melee")
	log_combat(A, D, "feline instincts (cat fight)")
	D.visible_message("<span class='warning'>[A] slashes there claws across [D]'s eyes!</span>", \
							"<span class='userdanger'>[A] slashes your eyes!</span>")
	D.apply_damage(7, BRUTE, BODY_ZONE_HEAD, def_check)
	D.blur_eyes(15)
	D.confused += 4
	D.apply_damage(10, EYE_DAMAGE, BODY_ZONE_PRECISE_EYES, def_check)
	A.do_attack_animation(D, ATTACK_EFFECT_CLAW)
	playsound(get_turf(D), 'sound/misc/catscream.ogg', 50, 1, -1)

//Ball Smasher, slamming your knee straight into there balls- Or cunt.
/datum/martial_art/cat_fight/proc/ballsmasher(mob/living/carbon/human/A, mob/living/carbon/human/D)
	log_combat(A, D, "groin smasher (cat fight)")
	D.visible_message("<span class='warning'>[A] knees [D] in the groin!</span>", \
						"<span class='userdanger'>[A] slams there knee into your groin!</span>")
	D.Knockdown(1) //Ow that would hurt.
	D.losebreath = clamp(D.losebreath + 10, 0, 8)
	D.adjustOxyLoss(20)
	playsound(get_turf(D), 'sound/effects/hit_kick.ogg', 50, 1, -1)

/datum/martial_art/cat_fight/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("H",D)
	if(check_streak(A,D))
		return TRUE
	return FALSE

/datum/martial_art/cat_fight/disarm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("D",D)
	if(check_streak(A,D))
		return TRUE
	return FALSE

/datum/martial_art/cat_fight/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("G",D)
	if(check_streak(A,D))
		return TRUE
	return FALSE

/mob/living/carbon/human/proc/nya_help()
	set name = "Recall Tyranny"
	set desc = "Remember how deep your degeneracy resides."
	set category = "Cat Fighting"

	to_chat(usr, "<b><i>You retreat inwards.... Nya~...</i></b>")

	to_chat(usr, "<span class='notice'>Groin Smasher</span>: Grab, Harm, Harm. You dig your knee into the opponents groin, causing loss of breath.")
	to_chat(usr, "<span class='notice'>Feline Instincts</span>: Disarm, Disarm. You flail your claws, scraping along your targets eyes.")
	to_chat(usr, "<span class='notice'>Swift Swipes</span>: Disarm, Harm, Grab. Like water, you swing your claws in rapid succession- No don't get my ears wet!")
	to_chat(usr, "<span class='notice'>Nya~</span>: Disarm, Harm, Harm, Disarm, Grab, Grab, Grab. Nya~ You monster what have you done!")

