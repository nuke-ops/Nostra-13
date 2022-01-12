/obj/item/reagent_containers/food/snacks/egg/blackegg
	name = "black egg"
	desc = "A finally shaped black egg, that seems to rattle to the touch."
	icon_state = "blackegg"
	icon = 'modular_nostra/icons/obj/food.dmi'
	throwforce = 10
	list_reagents = list(/datum/reagent/consumable/eggyolk = 5)
	//cooked_type = /obj/item/reagent_containers/food/snacks/boiledegg
	filling_color = "#F0E68C"
	foodtype = MEAT
	grind_results = list()

/obj/item/reagent_containers/food/snacks/egg/blackegg/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(!..()) //was it caught by a mob?
		var/mob/living/carbon/human/H = hit_atom
		if(iscarbon(hit_atom))
			if(H.is_eyes_covered())
				var/turf/T = get_turf(hit_atom)
				new/obj/effect/decal/cleanable/egg_smudge(T)
				reagents.reaction(hit_atom, TOUCH)
				qdel(src)
			else
				var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
				H.adjust_blindness(20)
				eyes?.applyOrganDamage(rand(10,20))
				H.Stun(10)
				H.emote("scream")
				var/turf/T = get_turf(hit_atom)
				new/obj/effect/decal/cleanable/egg_smudge(T)
				reagents.reaction(hit_atom, TOUCH)
				qdel(src)
		else
			var/turf/T = get_turf(hit_atom)
			new/obj/effect/decal/cleanable/egg_smudge(T)
			reagents.reaction(hit_atom, TOUCH)
			qdel(src)
