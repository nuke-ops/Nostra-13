/obj/item/carrotglaive
	icon_state = "carrotglaive0"
	icon = 'modular_nostra/icons/obj/items_and_weapons.dmi'
	lefthand_file = 'modular_nostra/icons/mob/inhands/weapons/polearm_lefthand.dmi'
	righthand_file = 'modular_nostra/icons/mob/inhands/weapons/polearm_righthand.dmi'
	name = "carrot glaive"
	desc = "So, you really thought that wrapping a carrot to a stick was a good idea? Well either way, you did, and... It's useful if your a madman."
	force = 7
	throwforce = 12
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	attack_verb = list("stabbed", "striked", "pierced", "gashed")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_POINTY
	max_integrity = 150
	reach = 2
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 10)
	//resistance_flags = FIRE_PROOF
	//wound_bonus = -15
	//bare_wound_bonus = 20
	var/wielded = FALSE // track wielded status on item

/obj/item/carrotglaive/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)

/obj/item/carrotglaive/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 50, 0 , hitsound) //axes are not known for being precision butchering tools
	AddComponent(/datum/component/two_handed, force_unwielded=5, force_wielded=12, icon_wielded="carrotglaive1")

/// triggered on wield of two handed item
/obj/item/carrotglaive/proc/on_wield(obj/item/source, mob/user)
	wielded = TRUE

/// triggered on unwield of two handed item
/obj/item/carrotglaive/proc/on_unwield(obj/item/source, mob/user)
	wielded = FALSE

/obj/item/carrotglaive/update_icon_state()
	icon_state = "carrotglaive0"
