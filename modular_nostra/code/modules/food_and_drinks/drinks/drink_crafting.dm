/datum/crafting_recipe/food/chwinger
	name = "Chwinger"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge = 1,
		/datum/reagent/consumable/ethanol/wine = 10,
		/obj/item/reagent_containers/food/snacks/cracker = 1
	)
	result = /obj/item/reagent_containers/food/drinks/drinkingglass/filled/chwinger
	subcategory = CAT_MISCFOOD

/obj/item/reagent_containers/food/drinks/drinkingglass/filled/chwinger
	name = "Chwinger"
	list_reagents = list(/datum/reagent/consumable/ethanol/chwinger = 50)
