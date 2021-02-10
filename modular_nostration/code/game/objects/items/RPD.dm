/obj/item/pipe_dispenser/science
	name = "Rapid Piping Device (RPD)"
	desc = "A device used to rapidly pipe things."
	icon = 'modular_nostration/icons/obj/tools.dmi'
	icon_state = "rpd_sci"
	lefthand_file = 'modular_nostration/icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'modular_nostration/icons/mob/inhands/equipment/tools_righthand.dmi'
	flags_1 = CONDUCT_1
	force = 10
	throwforce = 10
	throw_speed = 1
	throw_range = 5
	w_class = WEIGHT_CLASS_NORMAL
	custom_materials = list(/datum/material/iron=75000, /datum/material/glass=37500)
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
