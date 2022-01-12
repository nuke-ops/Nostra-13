
/datum/plant_gene/trait/brewing
	name = "Auto-Distilling Composition"

/datum/plant_gene/trait/plant_laughter
	name = "Hallucinatory Feedback"
	/// Sounds that play when this trait triggers
	var/list/sounds = list('modular_nostra/sound/effects/SitcomLaugh1.ogg', 'modular_nostra/sound/effects/SitcomLaugh2.ogg', 'modular_nostra/sound/effects/SitcomLaugh3.ogg')

/datum/plant_gene/trait/plant_laughter/on_new(obj/item/reagent_containers/food/snacks/grown/G, newloc)
	..()
	if(istype(G) && ispath(G.trash, /obj/item/grown))
		return
	var/obj/item/seeds/seed = G.seed
	var/stun_len = seed.potency * rate

	if(!istype(G, /obj/item/grown/bananapeel) && (!G.reagents || !G.reagents.has_reagent(/datum/reagent/lube)))
		stun_len /= 3

	G.AddComponent(/datum/component/slippery, min(stun_len,140), NONE, CALLBACK(src, .proc/handle_slip, G))

/datum/plant_gene/trait/plant_laughter/proc/handle_slip(obj/item/reagent_containers/food/snacks/grown/G, mob/M)
	for(var/datum/plant_gene/trait/T in G.seed.genes)
		T.on_slip(G, M)
		//say(G, "laughs")
		var/obj/item/seeds/seed = G.seed
		playsound(G, pick(sounds), ((seed.potency * 1.5) / 2) * 4, FALSE, SHORT_RANGE_SOUND_EXTRARANGE)


