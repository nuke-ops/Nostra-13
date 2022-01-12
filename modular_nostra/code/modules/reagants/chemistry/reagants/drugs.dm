/datum/actionspeed_modifier/kronkaine
	multiplicative_slowdown = -0.5
	id = ACTIONSPEED_ID_STIMULANTS

/datum/reagent/drug/kronkaine
	name = "kronkaine"
	description = "A highly illegal stimulant from the edge of the galaxy.\nIt is said the average kronkaine addict causes as much criminal damage as five stick up men, two rascals and one professional cambringo hustler combined."
	reagent_state = SOLID
	color = "#FAFAFA"
	taste_description = "numbing bitterness"
	pH = 8
	overdose_threshold = 20
	metabolization_rate = 0.75 * REAGENTS_METABOLISM
	addiction_threshold = 10

/datum/reagent/drug/kronkaine/on_mob_metabolize(mob/living/kronkaine_fiend)
	..()
	kronkaine_fiend.add_actionspeed_modifier(/datum/actionspeed_modifier/kronkaine)
	kronkaine_fiend.sound_environment_override = SOUND_ENVIRONMENT_HANGAR

/datum/reagent/drug/kronkaine/on_mob_end_metabolize(mob/living/kronkaine_fiend)
	kronkaine_fiend.remove_actionspeed_modifier(/datum/actionspeed_modifier/kronkaine)
	kronkaine_fiend.sound_environment_override = NONE
	. = ..()

/datum/reagent/drug/kronkaine/on_mob_life(mob/living/carbon/kronkaine_fiend, delta_time, times_fired)
	. = ..()
	SEND_SIGNAL(kronkaine_fiend, COMSIG_ADD_MOOD_EVENT, "tweaking", /datum/mood_event/overcharged, name)
	kronkaine_fiend.adjustOrganLoss(ORGAN_SLOT_HEART, 0.4 * REM * delta_time)
	kronkaine_fiend.Jitter(10 * REM * delta_time)
	kronkaine_fiend.AdjustSleeping(-20 * REM * delta_time)
	kronkaine_fiend.drowsyness = max(kronkaine_fiend.drowsyness - (5 * REM * delta_time), 0)
	if(volume < 10)
		return
	for(var/possible_purger in kronkaine_fiend.reagents.reagent_list)
		if(istype(possible_purger, /datum/reagent/medicine/haloperidol))
			kronkaine_fiend.ForceContractDisease(new /datum/disease/adrenal_crisis(), FALSE, TRUE) //We punish players for purging, since unchecked purging would allow players to reap the stamina healing benefits without any drawbacks. This also has the benefit of making haloperidol a counter, like it is supposed to be.
			break

/datum/reagent/drug/kronkaine/overdose_process(mob/living/kronkaine_fiend, delta_time, times_fired)
	. = ..()
	kronkaine_fiend.adjustOrganLoss(ORGAN_SLOT_HEART, 1 * REM * delta_time)
	kronkaine_fiend.Jitter(10 * REM * delta_time)
	if(DT_PROB(10, delta_time))
		to_chat(kronkaine_fiend, span_danger(pick("You feel like your heart is going to explode!", "Your ears are ringing!", "You sweat like a pig!", "You clench your jaw and grind your teeth.", "You feel prickles of pain in your chest.")))
