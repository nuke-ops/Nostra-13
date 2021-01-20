/mob/living/carbon/canZMove(dir, turf/target)
	return can_zTravel(target, dir) && (movement_type & FLOATING)
