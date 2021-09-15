// ENERGY CHAINSAW
/obj/item/chainsaw/energy
	name = "energy chainsaw"
	desc = "Become Leatherspace."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "echainsaw_off"
	lefthand_file = 'icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	force_on = 40
	w_class = WEIGHT_CLASS_HUGE
	attack_verb = list("sawed", "shred", "rended", "gutted", "eviscerated")
	actions_types = list(/datum/action/item_action/startchainsaw)
	armour_penetration = 50
	light_color = "#ff0000"
	var/onsound
	var/offsound
	onsound = 'modular_nostra/sound/weapons/echainsawon.ogg'
	offsound = 'modular_nostra/sound/weapons/echainsawoff.ogg'
	on = FALSE
	var/brightness_on = 3

/obj/item/chainsaw/energy/attack_self(mob/user)
	on = !on
	to_chat(user, "As you pull the starting cord dangling from [src], [on ? "it begins to whirr intimidatingly." : "the plasma microblades stop moving."]")
	force = on ? force_on : initial(force)
	playsound(user, on ? onsound : offsound , 50, 1)
	set_light(on ? brightness_on : 0)
	throwforce = on ? force_on : initial(force)
	icon_state = "echainsaw_[on ? "on" : "off"]"

	if(hitsound == "swing_hit")
		hitsound = pick('modular_nostra/sound/weapons/echainsawhit1.ogg','modular_nostra/sound/weapons/echainsawhit2.ogg')
	else
		hitsound = "swing_hit"

	if(src == user.get_active_held_item())
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
