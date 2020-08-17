/mob/living/silicon/ai/proc/show_laws_verb()
	set category = "AI Commands"
	set name = "Show Laws"
	if(usr.stat == DEAD)
		return //won't work if dead
	src.show_laws()

/mob/living/silicon/ai/show_laws(everyone = 0)
	if(!laws)
		return

	var/who

	if (everyone)
		who = world
	else
		who = src
	to_chat(who, "<b>Obey these laws:</b>")
	src.laws_sanity_check()
	src.laws.show_laws(who)

	if(!everyone)
		for(var/mob/living/silicon/robot/R in connected_robots)
			if(R.lawupdate)
				R.lawsync()
				R.show_laws()
				R.law_change_counter++



/mob/living/silicon/ai/make_laws()
	select_initial_lawset()

/mob/living/silicon/ai/laws_sanity_check()
	if (laws)
		return