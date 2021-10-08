/obj/item/extinguisher/bluespace
	name = "bluespace fire extinguisher"
	desc = "Even more advanced fire extinguisher for all your needs!"
	icon = 'modular_nostra/icons/obj/items_and_weapons.dmi'
	icon_state = "bluespace_extinguisher0"
	item_state = "bluespace_extinguisher"
	lefthand_file = 'modular_nostra/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'modular_nostra/icons/mob/inhands/items_righthand.dmi'
	hitsound = 'sound/weapons/smash.ogg'
	flags_1 = CONDUCT_1
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	throw_speed = 2
	throw_range = 6
	force = 10
	custom_materials = list(/datum/material/iron = 400)
	attack_verb = list("slammed", "whacked", "bashed", "thunked", "battered", "bludgeoned", "thrashed")
	dog_fashion = null
	resistance_flags = FIRE_PROOF
	max_water = 300
	power = 7 //Maximum distance launched water will travel
	precision = true //By default, turfs picked from a spray are random, set to 1 to make it always have at least one water effect per row
	cooling_power = 3 //Sets the cooling_temperature of the water reagent datum inside of the extinguisher when it is refilled
