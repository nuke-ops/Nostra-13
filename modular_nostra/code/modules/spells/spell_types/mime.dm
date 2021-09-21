
/obj/effect/proc_holder/spell/targeted/conjure_item/invisible_hardsuit
	name = "Illusionary Mimesuit"
	desc = "Form illusions replicating the Mimes signature garbs, making you fireproof and giving the ability to walk through space."
	invocation_type = "none"
	include_user = 1
	range = -1
	clothes_req = NONE
	item_type = /obj/item/clothing/suit/space/hardsuit/invmime
	active = FALSE
	school = "mime"
	charge_max = 100
	cooldown_min = 10
	action_icon = 'modular_nostra/icons/obj/actions_minor_antag.dmi'
	action_icon_state = "invisamime"
	action_background_icon_state = "bg_mime"

/obj/effect/proc_holder/spell/targeted/conjure_item/invisible_hardsuit/Trigger(mob/user)
	if(user.mind)
		if(!user.mind.miming)
			to_chat(usr, "<span class='notice'>You must dedicate yourself to silence first.</span>")
			return
		else
			cast()


/obj/effect/proc_holder/spell/targeted/conjure_item/invisible_hardsuit/cast(mob/user = usr)
	var/mob/living/carbon/human/H = usr
	if(delete_old && item && !QDELETED(item))
		to_chat(H, "<span class='warning'>Nothing is there...</span>")
		QDEL_NULL(item)
	else
		if(H.wear_suit)
			to_chat(H, "<span class='warning'>You're already wearing something!</span>")
			active = FALSE
			return
		else
			to_chat(H, "<span class='warning'>Nothing forms around your body!</span>")
			H.equip_to_slot_if_possible(make_item(), SLOT_WEAR_SUIT)

/obj/item/clothing/suit/space/hardsuit/invmime
	name = "suspenders"
	desc = "..."
	alt_desc = "..."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "suspenders"
	item_state = null
	hardsuit_type = "white"
	slowdown = 0
	flags_inv = null
	w_class = WEIGHT_CLASS_NORMAL
	armor = list("melee" = 30, "bullet" = 10, "laser" = 10, "energy" = 5, "bomb" = 60, "bio" = 10, "rad" = 60, "fire" = 100, "acid" = 70, "wound" = 10)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/invismime
	jetpack = /obj/item/tank/jetpack/suit
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS					//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	visor_flags = STOPSPRESSUREDAMAGE

/obj/item/clothing/head/helmet/space/hardsuit/invismime/update_icon_state()
	icon_state = "beretblack"

/obj/item/clothing/head/helmet/space/hardsuit/invismime
	name = "french beret"
	desc = "..."
	icon_state = "beretblack"
	item_state = null
	flags_inv = null
	hardsuit_type = null
	armor = list("melee" = 30, "bullet" = 5, "laser" = 5, "energy" = 5, "bomb" = 50, "bio" = 30, "rad" = 50, "fire" = 100, "acid" = 40, "wound" = 5)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/book/granter/spell/manifestmimesuit
	spell = /obj/effect/proc_holder/spell/targeted/conjure_item/invisible_hardsuit
	spellname = "Illusionary Mimesuit"
	name = "Guide to Illusions"
	desc = "The pages reflect light."
	icon_state ="bookmime"
	remarks = list("...")

/obj/item/book/granter/spell/manifestmimesuit/attack_self(mob/user)
	..()
	if(!locate(/obj/effect/proc_holder/spell/targeted/mime/speak) in user.mind.spell_list)
		user.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/mime/speak)

/obj/item/clothing/gloves/color/whiteinsulated
	name = "white gloves"
	desc = "..."
	icon_state = "white"
	item_state = "wgloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05

/*
	Man, this took a while to make. But damnit am I happy!
*/
