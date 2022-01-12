/obj/item/reagent_containers/food/snacks/pizza/blackolive
	icon = 'modular_nostra/icons/obj/pizzaspaghetti.dmi'
	name = "black olive pizza"
	desc = "A delicious black olive pizza."
	icon_state = "pizzablackolive"
	w_class = WEIGHT_CLASS_NORMAL
	slices_num = 6
	volume = 80
	slice_path = /obj/item/reagent_containers/food/snacks/pizzaslice/blackolive
	list_reagents = list(/datum/reagent/consumable/nutriment = 30, /datum/reagent/consumable/tomatojuice = 6, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/cooking_oil = 2)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "olive" = 1, "oil" = 1)
	foodtype = GRAIN | DAIRY | VEGETABLES

/obj/item/reagent_containers/food/snacks/pizzaslice/blackolive
	name = "black olive pizza slice"
	desc = "A slice of delicious black olive pizza."
	icon_state = "pizzablackoliveslice"
	icon = 'modular_nostra/icons/obj/pizzaspaghetti.dmi'
	filling_color = "#FFA500"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "olive" = 1 , "oil" = 1)
	foodtype = GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/pizza/greenolive
	icon = 'modular_nostra/icons/obj/pizzaspaghetti.dmi'
	name = "green olive pizza"
	desc = "A more sinister green olive pizza."
	icon_state = "pizzagreenolive"
	w_class = WEIGHT_CLASS_NORMAL
	slices_num = 6
	volume = 100
	slice_path = /obj/item/reagent_containers/food/snacks/pizzaslice/greenolive
	bonus_reagents = list(/datum/reagent/toxin/sinistatia = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 30, /datum/reagent/consumable/tomatojuice = 6, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/toxin/sinistatia = 1)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "olive" = 1, "oil" = 1, "acid" = 1)
	foodtype = GRAIN | DAIRY | VEGETABLES

/obj/item/reagent_containers/food/snacks/pizzaslice/greenolive
	name = "green olive pizza slice"
	desc = "A more sinister green olive pizza slice."
	icon_state = "pizzagreenoliveslice"
	icon = 'modular_nostra/icons/obj/pizzaspaghetti.dmi'
	filling_color = "#FFA500"
	bonus_reagents = list(/datum/reagent/toxin/sinistatia = 1)
	list_reagents = list(/datum/reagent/toxin/sinistatia = 1)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "olive" = 1 , "oil" = 1,  "acid" = 1)
	foodtype = GRAIN | VEGETABLES
