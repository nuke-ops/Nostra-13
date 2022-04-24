/obj/item/murasama
	icon_state = "murasama"
	icon = 'modular_nostra/icons/obj/items_and_weapons.dmi'
	//default_layer = BELT_LAYER, default_icon_file = 'modular_nostra/icons/mob/clothing/belt.dmi'
	//worn_icon = 'modular_nostra/icons/mob/clothing/belt.dmi'
	//get_belt_overlay = 'modular_nostra/icons/mob/clothing/belt.dmi' //Fuck it, can't get a custom belt path so I know what I'm doing.
	lefthand_file = 'modular_nostra/icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'modular_nostra/icons/mob/inhands/weapons/swords_righthand.dmi'
	name = "Murasama"
	desc = "There will be blood."
	force = 35
	throwforce = 20
	throw_speed = 5
	throw_range = 2
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BELT
	item_flags = (ITEM_CAN_BLOCK|ITEM_CAN_PARRY)//SLOWS_WHILE_IN_HAND
	//var/w_class_on = WEIGHT_CLASS_BULKY
	hitsound = 'sound/weapons/bladeslice.ogg'
	//var/hitsound_on = 'sound/weapons/blade1.ogg'
	armour_penetration = 45
	//var/saber_color = "green"
	//light_color = "#00ff00"//green
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 70)
	resistance_flags = FIRE_PROOF
	wound_bonus = -50
	bare_wound_bonus = 25
	//block_parry_data = /datum/block_parry_data/murasama
	block_chance = 50
	//var/hacked = FALSE
	var/can_reflect = TRUE
	total_mass = 2 //Survival flashlights typically weigh around 5 ounces.

///obj/item/murasama/update_icon()
	//belt_overlay = 'modular_nostra/icons/mob/clothing/belt.dmi'
	//icon_file = 'modular_nostra/icons/mob/clothing/belt.dmi'

/obj/item/murasama/directional_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return, override_direction)
	if((attack_type & ATTACK_TYPE_PROJECTILE) && is_energy_reflectable_projectile(object))
		block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_RETURN_TO_SENDER
		return BLOCK_SUCCESS | BLOCK_REDIRECTED | BLOCK_SHOULD_REDIRECT
	return ..()

/obj/item/murasama/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/sword_point)
	sharpness = SHARP_EDGED

/obj/item/murasama/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(can_reflect && is_energy_reflectable_projectile(object) && (attack_type & ATTACK_TYPE_PROJECTILE))
		block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_RETURN_TO_SENDER			//no you
		return BLOCK_SHOULD_REDIRECT | BLOCK_SUCCESS | BLOCK_REDIRECTED
	return ..()

/obj/item/murasama/pickup(mob/living/user)
	. = ..()
	//AddComponent(/datum/component/two_handed, require_twohands=TRUE, force_wielded=35)
	playsound(src, 'sound/items/unsheath.ogg', 25, 1)

///obj/item/murasama/dropped(mob/living/user)
//	. = ..()
	//RemoveComponent(/datum/component/two_handed)
