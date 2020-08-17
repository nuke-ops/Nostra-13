/**
  *This is the proc that handles the order of an item_attack.
  *The order of procs called is:
  *tool_act on the target. If it returns TRUE, the chain will be stopped.
  *pre_attack() on src. If this returns TRUE, the chain will be stopped.
  *attackby on the target. If it returns TRUE, the chain will be stopped.
  *and lastly
  *afterattack. The return value does not matter.
  */
/obj/item/proc/melee_attack_chain(mob/user, atom/target, params, flags, damage_multiplier = 1)
	if(isliving(user))
		var/mob/living/L = user
		if(!CHECK_MOBILITY(L, MOBILITY_USE) && !(flags & ATTACKCHAIN_PARRY_COUNTERATTACK))
			to_chat(L, "<span class='warning'>You are unable to swing [src] right now!</span>")
			return
	if(tool_behaviour && target.tool_act(user, src, tool_behaviour))
		return
	if(pre_attack(target, user, params))
		return
	if(target.attackby(src, user, params, flags, damage_multiplier))
		return
	if(QDELETED(src) || QDELETED(target))
		return
	afterattack(target, user, TRUE, params)

/// Like melee_attack_chain but for ranged.
/obj/item/proc/ranged_attack_chain(mob/user, atom/target, params)
	if(isliving(user))
		var/mob/living/L = user
		if(!CHECK_MOBILITY(L, MOBILITY_USE))
			to_chat(L, "<span class='warning'>You are unable to raise [src] right now!</span>")
			return
	afterattack(target, user, FALSE, params)

// Called when the item is in the active hand, and clicked; alternately, there is an 'activate held object' verb or you can hit pagedown.
/obj/item/proc/attack_self(mob/user)
	if(SEND_SIGNAL(src, COMSIG_ITEM_ATTACK_SELF, user) & COMPONENT_NO_INTERACT)
		return
	SEND_SIGNAL(user, COMSIG_MOB_ITEM_ATTACK_SELF, src) //Skyrat change
	interact(user)

/obj/item/proc/pre_attack(atom/A, mob/living/user, params) //do stuff before attackby!
	if(SEND_SIGNAL(src, COMSIG_ITEM_PRE_ATTACK, A, user, params) & COMPONENT_NO_ATTACK)
		return TRUE
	return FALSE //return TRUE to avoid calling attackby after this proc does stuff

// No comment
/atom/proc/attackby(obj/item/W, mob/user, params)
	if(SEND_SIGNAL(src, COMSIG_PARENT_ATTACKBY, W, user, params) & COMPONENT_NO_AFTERATTACK)
		return TRUE
	return FALSE

/obj/attackby(obj/item/I, mob/living/user, params)
	return ..() || ((obj_flags & CAN_BE_HIT) && I.attack_obj(src, user))

/mob/living/attackby(obj/item/I, mob/living/user, params, attackchain_flags, damage_multiplier)
	if(..())
		return TRUE
	I.attack_delay_done = FALSE //Should be set TRUE in pre_attacked_by()
	. = I.attack(src, user, attackchain_flags, damage_multiplier)
	if(!I.attack_delay_done) //Otherwise, pre_attacked_by() should handle it.
		user.changeNext_move(I.click_delay)

/obj/item/proc/attack(mob/living/M, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	if(SEND_SIGNAL(src, COMSIG_ITEM_ATTACK, M, user) & COMPONENT_ITEM_NO_ATTACK)
		return
	SEND_SIGNAL(user, COMSIG_MOB_ITEM_ATTACK, M, user)
	if(item_flags & NOBLUDGEON)
		return
	if(force && damtype != STAMINA && HAS_TRAIT(user, TRAIT_PACIFISM))
		to_chat(user, "<span class='warning'>You don't want to harm other living beings!</span>")
		return

	if(!force)
		playsound(loc, 'sound/weapons/tap.ogg', get_clamped_volume(), 1, -1)
	else if(hitsound)
		playsound(loc, hitsound, get_clamped_volume(), 1, -1)

	M.lastattacker = user.real_name
	M.lastattackerckey = user.ckey

	user.do_attack_animation(M)
	M.attacked_by(src, user, attackchain_flags, damage_multiplier)

	log_combat(user, M, "attacked", src.name, "(INTENT: [uppertext(user.a_intent)]) (DAMTYPE: [uppertext(damtype)])")
	add_fingerprint(user)

	var/weight = getweight(user, STAM_COST_ATTACK_MOB_MULT) //CIT CHANGE - makes attacking things cause stamina loss
	if(weight)
		user.adjustStaminaLossBuffered(weight)

	// CIT SCREENSHAKE
	if(force >= 15)
		shake_camera(user, ((force - 10) * 0.01 + 1), ((force - 10) * 0.01))
		if(M.client)
			switch (M.client.prefs.damagescreenshake)
				if (1)
					shake_camera(M, ((force - 10) * 0.015 + 1), ((force - 10) * 0.015))
				if (2)
					if(!CHECK_MOBILITY(M, MOBILITY_MOVE))
						shake_camera(M, ((force - 10) * 0.015 + 1), ((force - 10) * 0.015))

//the equivalent of the standard version of attack() but for object targets.
/obj/item/proc/attack_obj(obj/O, mob/living/user)
	if(SEND_SIGNAL(src, COMSIG_ITEM_ATTACK_OBJ, O, user) & COMPONENT_NO_ATTACK_OBJ)
		return
	if(item_flags & NOBLUDGEON)
		return
	user.do_attack_animation(O)
	if(!O.attacked_by(src, user))
		user.changeNext_move(click_delay)
	var/weight = getweight(user, STAM_COST_ATTACK_OBJ_MULT)
	if(weight)
		user.adjustStaminaLossBuffered(weight)//CIT CHANGE - makes attacking things cause stamina loss

/atom/movable/proc/attacked_by()
	return

/obj/attacked_by(obj/item/I, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	var/totitemdamage = I.force * damage_multiplier
	var/bad_trait

	var/stamloss = user.getStaminaLoss()
	var/next_move_mult = 1
	if(stamloss > STAMINA_NEAR_SOFTCRIT) //The more tired you are, the less damage you do.
		var/penalty = (stamloss - STAMINA_NEAR_SOFTCRIT)/(STAMINA_NEAR_CRIT - STAMINA_NEAR_SOFTCRIT)*STAM_CRIT_ITEM_ATTACK_PENALTY
		totitemdamage *= 1 - penalty
		next_move_mult += penalty*STAM_CRIT_ITEM_ATTACK_DELAY
	user.changeNext_move(I.click_delay*next_move_mult)

	if(SEND_SIGNAL(user, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_INACTIVE))
		bad_trait = SKILL_COMBAT_MODE //blacklist combat skills.

	if(I.used_skills && user.mind)
		if(totitemdamage)
			totitemdamage = user.mind.item_action_skills_mod(I, totitemdamage, I.skill_difficulty, SKILL_ATTACK_OBJ, bad_trait)
		for(var/skill in I.used_skills)
			if(!(SKILL_TRAIN_ATTACK_OBJ in I.used_skills[skill]))
				continue
			user.mind.auto_gain_experience(skill, I.skill_gain)

	if(totitemdamage)
		visible_message("<span class='danger'>[user] has hit [src] with [I]!</span>", null, null, COMBAT_MESSAGE_RANGE)
		//only witnesses close by and the victim see a hit message.
		log_combat(user, src, "attacked", I)
	take_damage(totitemdamage, I.damtype, "melee", 1)
	return TRUE

/mob/living/attacked_by(obj/item/I, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	var/list/block_return = list()
	var/totitemdamage = pre_attacked_by(I, user) * damage_multiplier
	if((user != src) && mob_run_block(I, totitemdamage, "the [I.name]", ((attackchain_flags & ATTACKCHAIN_PARRY_COUNTERATTACK)? ATTACK_TYPE_PARRY_COUNTERATTACK : NONE) | ATTACK_TYPE_MELEE, I.armour_penetration, user, null, block_return) & BLOCK_SUCCESS)
		return FALSE
	totitemdamage = block_calculate_resultant_damage(totitemdamage, block_return)
	send_item_attack_message(I, user, null, totitemdamage)
	I.do_stagger_action(src, user, totitemdamage)
	if(I.force)
		apply_damage(totitemdamage, I.damtype)
		if(I.damtype == BRUTE)
			if(prob(33))
				I.add_mob_blood(src)
				var/turf/location = get_turf(src)
				add_splatter_floor(location)
				if(totitemdamage >= 10 && get_dist(user, src) <= 1)	//people with TK won't get smeared with blood
					user.add_mob_blood(src)
		return TRUE //successful attack

/mob/living/simple_animal/attacked_by(obj/item/I, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	if(I.force < force_threshold || I.damtype == STAMINA)
		playsound(loc, 'sound/weapons/tap.ogg', I.get_clamped_volume(), 1, -1)
		user.changeNext_move(I.click_delay) //pre_attacked_by not called
	else
		return ..()

/mob/living/proc/pre_attacked_by(obj/item/I, mob/living/user)
	. = I.force
	if(!.)
		return

	var/stamloss = user.getStaminaLoss()
	var/stam_mobility_mult = 1
	var/next_move_mult = 1
	if(stamloss > STAMINA_NEAR_SOFTCRIT) //The more tired you are, the less damage you do.
		var/penalty = (stamloss - STAMINA_NEAR_SOFTCRIT)/(STAMINA_NEAR_CRIT - STAMINA_NEAR_SOFTCRIT)*STAM_CRIT_ITEM_ATTACK_PENALTY
		stam_mobility_mult -= penalty
		next_move_mult += penalty*STAM_CRIT_ITEM_ATTACK_DELAY
	if(stam_mobility_mult > LYING_DAMAGE_PENALTY && !CHECK_MOBILITY(user, MOBILITY_STAND)) //damage penalty for fighting prone, doesn't stack with the above.
		stam_mobility_mult = LYING_DAMAGE_PENALTY
	. *= stam_mobility_mult
	user.changeNext_move(I.click_delay*next_move_mult)
	I.attack_delay_done = TRUE

	var/bad_trait
	if(!(I.item_flags & NO_COMBAT_MODE_FORCE_MODIFIER))
		if(SEND_SIGNAL(user, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_INACTIVE))
			bad_trait = SKILL_COMBAT_MODE //blacklist combat skills.
			if(SEND_SIGNAL(src, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_ACTIVE))
				. *= 0.8
		else if(SEND_SIGNAL(src, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_INACTIVE))
			. *= 1.2

	if(!user.mind || !I.used_skills)
		return
	if(.)
		. = user.mind.item_action_skills_mod(I, ., I.skill_difficulty, SKILL_ATTACK_MOB, bad_trait)
	for(var/skill in I.used_skills)
		if(!(SKILL_TRAIN_ATTACK_MOB in I.used_skills[skill]))
			continue
		var/datum/skill/S = GLOB.skill_datums[skill]
		user.mind.auto_gain_experience(skill, I.skill_gain*S.item_skill_gain_multi)

// Proximity_flag is 1 if this afterattack was called on something adjacent, in your square, or on your person.
// Click parameters is the params string from byond Click() code, see that documentation.

/obj/item/proc/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	SEND_SIGNAL(src, COMSIG_ITEM_AFTERATTACK, target, user, proximity_flag, click_parameters)
	SEND_SIGNAL(user, COMSIG_MOB_ITEM_AFTERATTACK, target, user, proximity_flag, click_parameters)

/obj/item/proc/get_clamped_volume()
	if(w_class)
		if(force)
			return clamp((force + w_class) * 4, 30, 100)// Add the item's force to its weight class and multiply by 4, then clamp the value between 30 and 100
		else
			return clamp(w_class * 6, 10, 100) // Multiply the item's weight class by 6, then clamp the value between 10 and 100

/mob/living/proc/send_item_attack_message(obj/item/I, mob/living/user, hit_area, obj/item/bodypart/hit_bodypart)
	var/message_verb = "attacked"
	if(length(I.attack_verb))
		message_verb = "[pick(I.attack_verb)]"
	else if(!I.force)
		return
	var/message_hit_area = ""
	if(hit_area)
		message_hit_area = " in the [hit_area]"
	var/attack_message = "[src] is [message_verb][message_hit_area] with [I]!"
	var/attack_message_local = "You're [message_verb][message_hit_area] with [I]!"
	if(user in viewers(src, null))
		attack_message = "[user] [message_verb] [src][message_hit_area] with [I]!"
		attack_message_local = "[user] [message_verb] you[message_hit_area] with [I]!"
	if(user == src)
		attack_message_local = "You [message_verb] yourself[message_hit_area] with [I]"
	visible_message("<span class='danger'>[attack_message]</span>",\
		"<span class='userdanger'>[attack_message_local]</span>", null, COMBAT_MESSAGE_RANGE)
	return 1

/// How much stamina this takes to swing this is not for realism purposes hecc off.
/obj/item/proc/getweight(mob/living/user, multiplier = 1, trait = SKILL_STAMINA_COST)
	. = (total_mass || w_class * STAM_COST_W_CLASS_MULT) * multiplier
	if(!user)
		return
	var/bad_trait
	if(SEND_SIGNAL(user, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_INACTIVE))
		. *= STAM_COST_NO_COMBAT_MULT
		bad_trait = SKILL_COMBAT_MODE
	if(used_skills && user.mind)
		. = user.mind.item_action_skills_mod(src, ., skill_difficulty, trait, bad_trait, FALSE)
	var/total_health = user.getStaminaLoss()
	. = clamp(., 0, STAMINA_NEAR_CRIT - total_health)

/// How long this staggers for. 0 and negatives supported.
/obj/item/proc/melee_stagger_duration(force_override)
	if(!isnull(stagger_force))
		return stagger_force
	/// totally not an untested, arbitrary equation.
	return clamp((1.5 + (w_class/7.5)) * ((force_override || force) / 2), 0, 10 SECONDS)

/obj/item/proc/do_stagger_action(mob/living/target, mob/living/user, force_override)
	if(!CHECK_BITFIELD(target.status_flags, CANSTAGGER))
		return FALSE
	if(target.combat_flags & COMBAT_FLAG_SPRINT_ACTIVE)
		target.do_staggered_animation()
	var/duration = melee_stagger_duration(force_override)
	if(!duration)		//0
		return FALSE
	else if(duration > 0)
		target.Stagger(duration)
	else				//negative
		target.AdjustStaggered(duration)
	return TRUE

/mob/proc/do_staggered_animation()
	set waitfor = FALSE
	animate(src, pixel_x = -2, pixel_y = -2, time = 1, flags = ANIMATION_RELATIVE | ANIMATION_PARALLEL)
	animate(pixel_x = 4, pixel_y = 4, time = 1, flags = ANIMATION_RELATIVE)
	animate(pixel_x = -2, pixel_y = -2, time = 0.5, flags = ANIMATION_RELATIVE)
