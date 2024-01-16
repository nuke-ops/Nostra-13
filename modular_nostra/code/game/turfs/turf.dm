///returns if the turf has something dense inside it. if exclude_mobs is true, skips dense mobs like fat yoshi. if exclude_object is true, it will exclude the excluded_object you sent through
/turf/proc/is_blocked_turf(exclude_mobs, excluded_object)
	if(density)
		return TRUE
	for(var/i in contents)
		var/atom/thing = i
		if(thing == excluded_object)
			continue
		if(thing.density && (!exclude_mobs || !ismob(thing)))
			return TRUE
	return FALSE
