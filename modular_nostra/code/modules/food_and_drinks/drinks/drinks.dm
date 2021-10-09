/obj/item/reagent_containers/food/drinks/bluespaceflask
	name = "bluespace flask"
	desc = "Every good spaceman likes to carry there own flask of whiskey, now with more then double the carrying compacity!."
	icon_state = "bluespaceflask"
	icon = 'modular_nostra/icons/obj/drinks.dmi'
	custom_materials = list(/datum/material/iron=250, /datum/material/bluespace = 25)
	volume = 200
	isGlass = FALSE
	custom_price = PRICE_ABOVE_NORMAL

/datum/design/bluespaceflask
	name = "Bluespace Flask"
	desc = "Any spacemans dream."
	id = "bluespaceflask"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/bluespace = 250)
	build_path = /obj/item/reagent_containers/food/drinks/bluespaceflask
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
