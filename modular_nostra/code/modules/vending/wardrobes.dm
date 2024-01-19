/obj/machinery/vending/wardrobe/science_wardrobe/Initialize()
	products[/obj/item/storage/backpack/duffelbag/sci] = 3
	products = sort_list(products, /proc/cmp_typepaths_dsc)
	. = ..()
