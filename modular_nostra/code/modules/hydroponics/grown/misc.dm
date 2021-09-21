
/obj/item/seeds/syndieseeds
	name = "pack of suspicious seeds"
	desc = "These seeds grow..."
	icon = 'modular_nostra/icons/obj/seeds.dmi'
	icon_state = "seed-syndiefruit"
	species = "unusual plant"
	plantname = "unusual plant"
	product = /obj/item/reagent_containers/food/snacks/grown/shell/syndieseeds
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	lifespan = 15
	endurance = 30
	maturation = 20
	production = 5
	yield = 2
	potency = 45
	rarity = 999
	icon_grow = "xpod-grow"
	icon_dead = "xpod-dead"
	icon_harvest = "xpod-harvest"
	growthstages = 4
	
/obj/item/reagent_containers/food/snacks/grown/shell/syndieseeds
	seed = /obj/item/seeds/syndieseeds
	icon = 'modular_nostra/icons/obj/harvest.dmi'
	name = "unusual fruit"
	desc = "It smells like sourness and lead."
	icon_state = "unusualfruit"
	trash = /obj/item/gun/ballistic/shotgun/boltaction
	bitesize_mod = 3
	foodtype = FRUIT
	tastes = list("sweetness" = 1)
	wine_power = 10
