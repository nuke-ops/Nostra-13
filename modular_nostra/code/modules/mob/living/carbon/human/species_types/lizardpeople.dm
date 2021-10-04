/datum/species/lizard/on_species_gain(mob/living/carbon/human/C)
	if(C.dna.features["mam_snouts"] == "None")
		C.dna.features["mam_snouts"] = "Sharp"
		C.update_body()
	return ..()
