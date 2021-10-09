/datum/reagent/toxin/sinistatia
	name = "sinistatia"
	description = "A dark truth lies within the green olive, only baked will you find it's sinister deeds."
	reagent_state = LIQUID
	color = "#6C8533"
	taste_description = "sour acidicness"
	pH = 10
	overdose_threshold = 30
	metabolization_rate = 0.4 * REAGENTS_METABOLISM

/datum/reagent/toxin/sinistatia/on_mob_life(mob/living/carbon/M)

	if(prob(75) && iscarbon(M))
		to_chat(M, span_danger("Your stomach feels sick..."))
		M.jitteriness += 3
		M.dizziness += 2
		M.adjustToxLoss(1)

	if(prob(10) && iscarbon(M))
		to_chat(M, span_danger("You feel like your stomach is melting!"))
		M.Stun(15)
		M.drowsyness = rand(1, 3)
		M.adjustToxLoss(rand(5, 10), 0.2)
		M.adjustOrganLoss(ORGAN_SLOT_STOMACH, 5)
		M.adjustOrganLoss(ORGAN_SLOT_LIVER, 1)
	..()

/datum/reagent/toxin/sinistatia/on_mob_end_metabolize(mob/living/carbon/M)
	if(prob(5) && iscarbon(M))
		to_chat(M, span_danger("You feel a searing pain in your stomach!"))
		M.adjustOrganLoss(ORGAN_SLOT_STOMACH, 20)
		M.adjustToxLoss(rand(20, 30), 0.1)
	. = ..()


/datum/reagent/toxin/sinistatia/overdose_process(mob/living/carbon/M)
	if(prob(30) && iscarbon(M))
		to_chat(M, span_danger("You don't feel very good..."))
		M.Unconscious(20)
		M.adjustOrganLoss(ORGAN_SLOT_STOMACH, 1)
		M.adjustOrganLoss(ORGAN_SLOT_LIVER, 5)
	. = ..()
