/obj/item/clothing/suit/space/hardsuit/sundowner
	name = "Red Sun Armor"
	desc = "I'M FUCKING INVINCIBLE!!!"
	alt_desc = "I'M FUCKING INVINCIBLE!!!"
	icon = 'modular_nostra/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/suit_digi.dmi'
	icon_state = "sundowner_suit"
	item_state = "sundowner_suit"
	hardsuit_type = "syndi"
	slowdown = 1.3
	w_class = WEIGHT_CLASS_HUGE
	armor = list("melee" = 30, "bullet" = 65, "laser" = 50, "energy" = 45, "bomb" = 95, "bio" = 0, "rad" = 10, "fire" = 50, "acid" = 50, "wound" = 20)
	allowed = list(/obj/item/claymore/bloodlust, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/sundowner
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS					//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	//visor_flags = STOPSPRESSUREDAMAGE

	///obj/item/clothing/head/helmet/space/hardsuit/invismime/update_icon_state()
	//icon_state = "beretblack"

/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible
	name = "Deploy Shield"
	desc = "Allows the ability to deploy/retract your shield. Requires two-hands."
	invocation_type = "none"
	//invocation = null
	include_user = 1
	range = -1
	clothes_req = NONE
	item_type = /obj/item/shield/redshield
	school = "conjuration"
	charge_max = 100
	cooldown_min = 15
	action_icon = 'modular_nostra/icons/obj/actions_minor_antag.dmi'
	action_icon_state = "sundowner_deploy"
	delete_old = TRUE

/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible/cast(list/targets, mob/user = usr)
	if (delete_old && item && !QDELETED(item))
		QDEL_NULL(item)
		playsound(loc, 'modular_nostra/sound/weapons/shieldretract.ogg', 30)
		//invocation = null
	else
		for(var/mob/living/carbon/C in targets)
			if(!C.get_active_held_item() && !C.get_inactive_held_item())
				//invocation = "I'M FUCKING INVINCIBLE!!!!"
				C.put_in_hands(make_item(), TRUE)
				playsound(loc, 'modular_nostra/sound/weapons/shieldeploy.ogg', 30)
			else
				to_chat(C, "<span class = 'userdanger'>You must have both hands empty!</span>")
				//invocation = null
				return

/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible/Destroy()
	if(item)
		qdel(item)
	return ..()

/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible/make_item()
	item = new item_type
	return item

/obj/item/clothing/suit/space/hardsuit/sundowner/equipped(mob/user, slot)
	. = ..()
	if(ishuman(user) && slot == ITEM_SLOT_OCLOTHING)
		//var/mob/living/carbon/human/H = user
		user.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible(src))

/obj/item/clothing/suit/space/hardsuit/sundowner/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.get_item_by_slot(ITEM_SLOT_OCLOTHING) == src)
		user.mind.RemoveSpell(/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible)




/obj/effect/proc_holder/spell/aimed/magnetism
	name = "Magnetic Power!"
	desc = "Allows you to draw objects to a specified location!"
	charge_type = "recharge"
	charge_max	= 150
	cooldown_min = 50
	clothes_req = NONE
	invocation_type = "none"
	range = 20
	selection_type = "view"
	projectile_type = null
	antimagic_allowed = FALSE

	active_msg = "You feel energy begin to flow through your body, you can feel the magnetic power..."
	deactive_msg = "You relax, the flow of energy dissipating from your mind..."
	action_icon = 'modular_nostra/icons/obj/actions_minor_antag.dmi'
	base_icon_state = "magnetism"
	action_icon_state = "magnetism_disabled"


/obj/effect/proc_holder/spell/aimed/magnetism/cast(list/targets, mob/user = usr)
	var/target = get_turf(targets[1])

	if(get_dist(user,target)>range)
		to_chat(user, "<span class='notice'>\The [target] is too far away!</span>")
		return

	. = ..()
	if(!.)
		return

	for(var/obj/item/I in orange(9, target))
		if(!I.anchored)
			I.throw_at(target, 5, 4)

/obj/effect/proc_holder/spell/aimed/magnetism/update_icon()
	if(!action)
		return
	if(active)
		action.button_icon_state = base_icon_state
	else
		action.button_icon_state = action_icon_state

	action.UpdateButtonIcon()
	return



/obj/item/clothing/head/helmet/space/hardsuit/sundowner
	name = "Red Sun Helmet"
	desc = "Red Sun, Red Sun over PARADISE!"
	icon = 'modular_nostra/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "sundowner_suit"
	item_state = "sundowner_suit"
	hardsuit_type = "syndi"
	armor = list("melee" = 25, "bullet" = 50, "laser" = 45, "energy" = 40, "bomb" = 95, "bio" = 0, "rad" = 5, "fire" = 50, "acid" = 50, "wound" = 20)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/head/helmet/space/hardsuit/sundowner/update_icon_state()
	icon_state = "sundowner_suit"


/obj/item/clothing/suit/armor/minuano
	name = "Minuano"
	desc = "Mind if I cut in?"
	icon = 'modular_nostra/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/suit_digi.dmi'
	icon_state = "jetstream_sam"
	item_state = "jetstream_sam"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(MELEE = 70, BULLET = 25, LASER = 25, ENERGY = 25, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100, WOUND = 45)
	blocks_shove_knockdown = TRUE
	strip_delay = 80
	equip_delay_other = 60
	slowdown = 0

/obj/item/clothing/suit/armor/minuano/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_OCLOTHING)
		slowdown = -0.5

/obj/item/clothing/suit/armor/minuano/dropped(mob/user)
	. = ..()
	slowdown = 0




/obj/item/clothing/suit/space/hardsuit/monsoon
	name = "Electromagnetism Armor"
	desc = "Memes... Echo through your mind, the meaning of your soul..."
	alt_desc = "Memes..."
	icon = 'modular_nostra/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/suit_digi.dmi'
	icon_state = "monsoon_suit"
	item_state = "monsoon_suit"
	hardsuit_type = "syndi"
	slowdown = 0
	w_class = WEIGHT_CLASS_HUGE
	armor = list("melee" = 45, "bullet" = 45, "laser" = 30, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 100, "fire" = 100, "acid" = 100, "wound" = 75)
	allowed = list(/obj/item/claymore/dystopia, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/monsoon
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS					//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/head/helmet/space/hardsuit/monsoon
	name = "Winds of Destruction"
	desc = "You feel the world shift around you, the flow of energy along your fingertips..."
	icon = 'modular_nostra/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "monsoon_suit"
	item_state = "monsoon_suit"
	flags_inv = null
	hardsuit_type = "syndi"
	armor = list("melee" = 45, "bullet" = 25, "laser" = 20, "energy" = 60, "bomb" = 0, "bio" = 0, "rad" = 100, "fire" = 100, "acid" = 100, "wound" = 75)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/head/helmet/space/hardsuit/monsoon/update_icon_state()
	icon_state = "monsoon_suit"

/obj/item/clothing/head/helmet/space/hardsuit/monsoon/equipped(mob/user, slot)
	. = ..()
	if(ishuman(user) && slot == ITEM_SLOT_HEAD)
		//var/mob/living/carbon/human/H = user
		user.mind.AddSpell(new /obj/effect/proc_holder/spell/aimed/magnetism(src))

/obj/item/clothing/head/helmet/space/hardsuit/monsoon/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.get_item_by_slot(ITEM_SLOT_HEAD) == src)
		user.mind.RemoveSpell(/obj/effect/proc_holder/spell/aimed/magnetism)

/obj/item/clothing/suit/space/hardsuit/monsoon/equipped(mob/user, slot)
	. = ..()
	if(ishuman(user) && slot == ITEM_SLOT_OCLOTHING)
		//var/mob/living/carbon/human/H = user
		user.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/smoke(src))

/obj/item/clothing/suit/space/hardsuit/monsoon/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.get_item_by_slot(ITEM_SLOT_OCLOTHING) == src)
		user.mind.RemoveSpell(/obj/effect/proc_holder/spell/targeted/smoke)
