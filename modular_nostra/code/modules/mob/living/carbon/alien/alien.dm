/mob/living/carbon/alien
	var/isbenothropy // Too ensure Benothropy is not O.P. like an actual Xeno.

/mob/living/carbon/alien/create_internal_organs()
	. = ..()
	if(isbenothropy) // Pointless to have as a Benothropy.
		var/obj/item/organ/alien/hivenode/remove_me = locate(/obj/item/organ/alien/hivenode) in internal_organs
		if(remove_me)
			internal_organs -= remove_me
			qdel(remove_me)
