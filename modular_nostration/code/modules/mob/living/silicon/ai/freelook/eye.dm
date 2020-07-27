//it uses setLoc not forceMove, talks to the sillycone and not the camera mob
/mob/camera/aiEye/zMove(dir, feedback = FALSE)
	if(dir != UP && dir != DOWN)
		return FALSE
	var/turf/target = get_step_multiz(src, dir)
	if(!target)
		if(feedback)
			to_chat(ai, "<span class='warning'>There's nowhere to go in that direction!</span>")
		return FALSE
	if(!canZMove(dir, target))
		if(feedback)
			to_chat(ai, "<span class='warning'>You couldn't move there!</span>")
		return FALSE
	setLoc(target, TRUE)
	return TRUE

/mob/camera/aiEye/canZMove(direction, turf/target) //cameras do not respect these FLOORS you speak so much of
	return TRUE
