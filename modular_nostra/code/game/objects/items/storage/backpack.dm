/obj/item/storage/backpack/duffelbag/sci
	name = "science duffel bag"
	desc = "A large duffel bag for holding extra science supplies."
	icon = 'modular_nostra/icons/obj/storage.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_nostra/icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'modular_nostra/icons/mob/inhands/equipment/backpack_righthand.dmi'
	icon_state = "duffel-sci"
	item_state = "duffel-sci"

/obj/item/storage/backpack/duffelbag/sci/surgery
	name = "surgical duffel bag"
	desc = "A large duffel bag for holding extra science supplies - this one seems to be designed for holding surgical tools."

/obj/item/storage/backpack/duffelbag/sci/surgery/PopulateContents()
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

/obj/item/storage/backpack/duffelbag/sci/nanites
	name = "Nanite duffel bag"
	desc = "A large duffel bag for holding extra science supplies - this one seems to be designed for holding nanite tools."

/obj/item/storage/backpack/duffelbag/sci/nanites/PopulateContents()
	new /obj/item/nanite_remote(src)
	new /obj/item/nanite_remote(src)
	new /obj/item/nanite_scanner(src)
	new /obj/item/nanite_scanner(src)
	new /obj/item/storage/box/disks_nanite(src)
	new /obj/item/clothing/glasses/hud/diagnostic(src)
	new /obj/item/clothing/glasses/hud/diagnostic(src)

/obj/item/storage/backpack/duffelbag/sci/circuits
	name = "Circuit duffel bag"
	desc = "A large duffel bag for holding extra science supplies - this one seems to be designed for holding circuit tools."

/obj/item/storage/backpack/duffelbag/sci/circuits/PopulateContents()
	new /obj/item/integrated_electronics/analyzer(src)
	new /obj/item/integrated_electronics/wirer(src)
	new /obj/item/integrated_electronics/debugger(src)
	new /obj/item/stack/sheet/glass/fifty(src)
	new /obj/item/stack/sheet/metal/ten(src)
	new /obj/item/stock_parts/cell/high(src)
	new /obj/item/screwdriver(src)
	new /obj/item/multitool(src)

/obj/item/storage/backpack/duffelbag/sci/tools
	name = "Tools duffel bag"
	desc = "A large duffel bag for holding extra science supplies - this one seems to be designed for holding tools."

/obj/item/storage/backpack/duffelbag/sci/tools/PopulateContents()

	new /obj/item/wrench(src)
	new /obj/item/crowbar(src)
	new /obj/item/weldingtool(src)
	new /obj/item/multitool(src)
	new /obj/item/screwdriver(src)
	new /obj/item/wirecutters(src)
	new /obj/item/clothing/glasses/welding(src)
	new /obj/item/stock_parts/cell/high(src)
	new /obj/item/borg/upgrade/restart(src)
