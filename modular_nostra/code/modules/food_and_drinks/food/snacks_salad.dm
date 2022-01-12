/obj/item/reagent_containers/food/snacks/salad/blackolivesalad
	name = "Black Olive Salad"
	desc = "A delicious black olive salad, though your bound to just eat all the olives."
	icon_state = "blackolivesalad"
	icon = 'modular_nostra/icons/obj/soupsalad.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 10)
	tastes = list("leaves" = 1, "olive" = 1)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/salad/greenolivesalad
	name = "Green Olive Salad"
	desc = "A sinister salad for a sinister olive."
	icon_state = "greenolivesalad"
	icon = 'modular_nostra/icons/obj/soupsalad.dmi'
	bonus_reagents = list(/datum/reagent/toxin/sinistatia = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 10, /datum/reagent/toxin/sinistatia = 1)
	tastes = list("leaves" = 1, "olive" = 1,  "acid" = 1)
	foodtype = VEGETABLES
