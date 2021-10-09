
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

/obj/item/seeds/aloevereturn
	name = "pack of aloevereturn seeds"
	desc = "These seeds grow boomerang shaped leafs."
	icon_state = "seed-aloevereturn"
	icon = 'modular_nostra/icons/obj/seeds.dmi'
	species = "aloe"
	plantname = "Aloevereturn"
	product = /obj/item/reagent_containers/food/snacks/grown/aloerang
	lifespan = 80
	endurance = 20
	maturation = 2
	production = 5
	yield = 2
	growthstages = 5
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	growing_icon = 'icons/obj/hydroponics/growing_vegetables.dmi'
	rarity = 50
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.05, /datum/reagent/toxin/rotatium = 0.5)

/obj/item/reagent_containers/food/snacks/grown/aloerang
	seed = /obj/item/seeds/aloevereturn
	name = "aloevereturn"
	desc = "A plant barbed with nettles in the shape of a boomerang, perhaps you can throw it..."
	icon = 'modular_nostra/icons/obj/harvest.dmi'
	icon_state = "aloevereturn"
	force = 5
	throwforce = 15
	throw_range = 15
	wound_bonus = CANT_WOUND

/obj/item/reagent_containers/food/snacks/grown/aloerang/add_juice()
	..()
	throwforce = round((6 + seed.potency / 2), 1)

/obj/item/reagent_containers/food/snacks/grown/aloerang/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	var/caught = hit_atom.hitby(src, FALSE, FALSE, throwingdatum=throwingdatum)
	if(ishuman(hit_atom) && !caught && thrownby)
		if(force > 0)
			force -= 1.5
	if(thrownby && !caught)
		sleep(1)
		if(!QDELETED(src))
			if(force > 0)
				playsound(src, 'modular_nostra/sound/effects/booonk.ogg', 50, 1, -2)
				var/mob/living/carbon/H = thrownby
				H.throw_mode_on()
				throw_at(thrownby, 25, throw_speed, null, TRUE)
				. = ..()
			else
				var/mob/living/carbon/H = thrownby
				to_chat(H, "The leaves suddenly shatter apart from the impact!")
				qdel(src)

/obj/item/seeds/olives
	name = "pack of olive seeds"
	desc = "The perfect side dish to any-course."
	icon_state = "seed-olive"
	icon = 'modular_nostra/icons/obj/seeds.dmi'
	species = "olive"
	plantname = "Olive Tree"
	product = /obj/item/reagent_containers/food/snacks/grown/olive
	lifespan = 30
	endurance = 18
	yield = 6
	instability = 40
	potency = 2
	growing_icon = 'modular_nostra/icons/obj/growing_fruits.dmi'
	icon_grow = "olive-grow"
	icon_harvest = "olive-harvest"
	icon_dead = "apple-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/olives/green)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.08, /datum/reagent/consumable/nutriment = 0.05, /datum/reagent/consumable/cooking_oil = 0.3)

/obj/item/reagent_containers/food/snacks/grown/olive
	seed = /obj/item/seeds/olives
	name = "olive"
	desc = "Perfect on salads and pizza!"
	icon = 'modular_nostra/icons/obj/harvest.dmi'
	icon_state = "olive"
	filling_color = "#A4795A"
	bitesize = 100
	foodtype = FRUIT
	juice_results = list(/datum/reagent/consumable/cooking_oil = 2)
	tastes = list("sour" = 1, "bitter" = 1)
	distill_reagent = null

/obj/item/seeds/olives/green
	name = "pack of green olive seeds"
	desc = "These seeds grow into golden apple trees. Good thing there are no firebirds in space."
	icon_state = "seed-olivegreen"
	species = "olivegreen"
	plantname = "Green Olive Tree"
	product = /obj/item/reagent_containers/food/snacks/grown/olive/green
	maturation = 5
	production = 6
	potency = 15
	icon_harvest = "olivegreen-harvest"
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.01, /datum/reagent/consumable/nutriment = 0.008, /datum/reagent/toxin = 0.2)
	rarity = 20

/obj/item/reagent_containers/food/snacks/grown/olive/green
	seed = /obj/item/seeds/olives/green
	name = "green olive"
	desc = "The more sinister olive."
	icon = 'modular_nostra/icons/obj/harvest.dmi'
	icon_state = "greenolive"
	filling_color = "#A4795A"
	distill_reagent = null
	foodtype = TOXIC
	tastes = list("acidic sourness" = 1)
	distill_reagent = /datum/reagent/toxin/sinistatia

/obj/item/reagent_containers/food/snacks/grown/olive/green/Initialize()
	. =..()
	reagents.clear_reagents()
	reagents.add_reagent(/datum/reagent/toxin, seed.potency * 0.05)

//Korta Nut - TG Port
/obj/item/seeds/korta_nut
	name = "pack of korta nut seeds"
	desc = "These seeds grow into korta nut bushes, native to Tizira."
	icon_state = "seed-korta"
	icon = 'modular_nostra/icons/obj/lizards/seeds.dmi'
	species = "kortanut"
	plantname = "Korta Nut Bush"
	product = /obj/item/reagent_containers/food/snacks/grown/korta_nut
	lifespan = 55
	endurance = 35
	yield = 5
	growing_icon = 'modular_nostra/icons/obj/lizards/growing_fruits.dmi'
	icon_grow = "kortanut-grow"
	icon_dead = "kortanut-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/korta_nut/sweet)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)

/obj/item/reagent_containers/food/snacks/grown/korta_nut
	seed = /obj/item/seeds/korta_nut
	name = "korta nut"
	desc = "A little nut of great importance. Has a peppery shell which can be ground into flour and a soft, pulpy interior that produces a milky fluid when juiced. Or you can eat them whole, as a quick snack."
	icon_state = "korta_nut"
	icon = 'modular_nostra/icons/obj/lizards/harvest.dmi'
	foodtype = NUTS
	grind_results = list(/datum/reagent/consumable/korta_flour = 0.2)
	juice_results = list(/datum/reagent/consumable/korta_milk = 0.2)
	tastes = list("peppery heat" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/kortara

//Sweet Korta Nut
/obj/item/seeds/korta_nut/sweet
	name = "pack of sweet korta nut seeds"
	desc = "These seeds grow into sweet korta nuts, a mutation of the original species that produces a thick syrup that Tizirans use for desserts."
	icon_state = "seed-sweetkorta"
	icon = 'modular_nostra/icons/obj/lizards/seeds.dmi'
	species = "kortanut"
	plantname = "Sweet Korta Nut Bush"
	product = /obj/item/reagent_containers/food/snacks/grown/korta_nut/sweet
	maturation = 10
	production = 10
	mutatelist = null
	reagents_add = list(/datum/reagent/consumable/korta_nectar = 0.1, /datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	rarity = 20

/obj/item/reagent_containers/food/snacks/grown/korta_nut/sweet
	seed = /obj/item/seeds/korta_nut/sweet
	name = "sweet korta nut"
	desc = "A sweet treat lizards love to eat."
	icon = 'modular_nostra/icons/obj/lizards/harvest.dmi'
	icon_state = "korta_nut"
	grind_results = list(/datum/reagent/consumable/korta_flour = 0.2)
	juice_results = list(/datum/reagent/consumable/korta_milk = 0.2, /datum/reagent/consumable/korta_nectar = 0.2)
	tastes = list("peppery sweet" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/kortara

// Lizard Reagents

/datum/reagent/consumable/korta_flour
	name = "Korta Flour"
	description = "A coarsely ground, peppery flour made from korta nut shells."
	taste_description = "earthy heat"
	color = "#EEC39A"

/datum/reagent/consumable/korta_milk
	name = "Korta Milk"
	description = "A milky liquid made by crushing the centre of a korta nut."
	taste_description = "sugary milk"
	color = "#FFFFFF"

/datum/reagent/consumable/korta_nectar
	name = "Korta Nectar"
	description = "A sweet, sugary syrup made from crushed sweet korta nuts."
	color = "#d3a308"
	nutriment_factor = 5 * REAGENTS_METABOLISM
	metabolization_rate = 1 * REAGENTS_METABOLISM
	taste_description = "peppery sweetness"

/obj/item/seeds/kronkus
	name = "pack of kronkus seeds"
	desc = "A pack of highly illegal kronkus seeds.\nPossession of these seeds carries the death penalty in 7 sectors."
	icon_state = "seed-kronkus"
	icon = 'modular_nostra/icons/obj/lizards/seeds.dmi'
	species = "kronkus"
	plantname = "Kronkus Vine"
	product = /obj/item/reagent_containers/food/snacks/grown/kronkus
	//shitty stats, because botany is easy
	lifespan = 60
	endurance = 10
	maturation = 8
	production = 4
	yield = 3
	growthstages = 3
	growing_icon = 'modular_nostra/icons/obj/lizards/growing.dmi'
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.05)

/obj/item/reagent_containers/food/snacks/grown/kronkus
	seed = /obj/item/seeds/kronkus
	name = "kronkus vine segment"
	desc = "A piece of mature kronkus vine. It exudes a sharp and noxious odor."
	icon_state = "kronkus"
	icon = 'modular_nostra/icons/obj/lizards/harvest.dmi'
	filling_color = "#37946e"
	foodtype = VEGETABLES | TOXIC
	distill_reagent = /datum/reagent/kronkus_extract

/datum/reagent/kronkus_extract
	name = "kronkus extract"
	description = "A frothy extract made from fermented kronkus vine pulp.\nHighly bitter due to the presence of a variety of kronkamines."
	taste_description = "bitterness"
	color = "#228f63"
	//addiction_types = list(/datum/addiction/stimulants = 5)

/datum/reagent/kronkus_extract/on_mob_life(mob/living/carbon/kronkus_enjoyer)
	. = ..()
	kronkus_enjoyer.adjustOrganLoss(ORGAN_SLOT_HEART, 0.1)
	kronkus_enjoyer.adjustStaminaLoss(-2, FALSE)

/// Barrel melon Seeds
/obj/item/seeds/watermelon/barrel
	name = "pack of barrelmelon seeds"
	desc = "These seeds grow into barrelmelon plants."
	icon_state = "seed-barrelmelon"
	icon = 'modular_nostra/icons/obj/lizards/seeds.dmi'
	species = "barrelmelon"
	plantname = "Barrel Melon Vines"
	product = /obj/item/reagent_containers/food/snacks/grown/barrelmelon
	genes = list(/datum/plant_gene/trait/brewing)
	mutatelist = null
	growing_icon = 'modular_nostra/icons/obj/lizards/growing_fruits.dmi'
	reagents_add = list(/datum/reagent/consumable/ethanol/ale = 0.2, /datum/reagent/consumable/nutriment = 0.1)
	rarity = 10

/// Barrel melon Fruit
/obj/item/reagent_containers/food/snacks/grown/barrelmelon
	seed = /obj/item/seeds/watermelon/barrel
	name = "barrelmelon"
	desc = "The nutriments within this melon have been compressed and fermented into rich alcohol."
	icon_state = "barrelmelon"
	icon = 'modular_nostra/icons/obj/lizards/harvest.dmi'
	distill_reagent = /datum/reagent/medicine/antihol //You can call it a integer overflow.
