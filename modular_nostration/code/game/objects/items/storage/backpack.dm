/obj/item/storage/backpack/duffelbag/sci
	name = "science duffel bag"
	desc = "A large duffel bag for holding extra science supplies."
	icon = 'modular_nostration/icons/obj/storage.dmi'
	mob_overlay_icon = 'modular_nostration/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_nostration/icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'modular_nostration/icons/mob/inhands/equipment/backpack_righthand.dmi'
	icon_state = "duffel-sci"
	item_state = "duffel-sci"

/obj/item/storage/backpack/duffelbag/sci/surgery
	name = "surgical duffel bag"
	desc = "A large duffel bag for holding extra science supplies - this one seems to be designed for holding surgical tools."

/obj/item/storage/backpack/duffelbag/med/surgery/PopulateContents()
	new /obj/item/scalpel(src)
	new /obj/item/hemostat(src)
	new /obj/item/retractor(src)
	new /obj/item/circular_saw(src)
	new /obj/item/surgicaldrill(src)
	new /obj/item/cautery(src)
	new /obj/item/bonesetter(src)
	new /obj/item/surgical_drapes(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/reagent_containers/medspray/sterilizine(src)
	new /obj/item/razor(src)
