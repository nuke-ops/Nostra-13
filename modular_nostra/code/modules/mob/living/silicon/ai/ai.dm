/datum/ai_laws
	var/selectable = 0
	var/benevolent = 0 //whether an AI can choose this as their starting lawset	var/benevolent = 0 //whether an AI can choose this as their starting lawset

//ai pick lawset

/mob/living/silicon/ai/Login()
	..()
	if (!laws)
		make_laws()

/*
/mob/living/silicon/ai/verb/do_lawsync()
	set name = "Synchronise Laws"
	set category = "AI Commands"

	if(usr.stat == DEAD)
		return //won't work if dead

	var/turf/ai_current_turf = get_turf(src)
	var/ai_Zlevel = ai_current_turf.z
	for(var/mob/living/silicon/robot/R in GLOB.silicon_mobs)
		if(get_turf(R) in ai_Zlevel)
			R.connected_ai = usr
			R.lawsync()
			R.show_laws()
	to_chat(usr, "<span class='warning'>Laws synchronised with active robots!</span>")
*/

/mob/living/silicon/ai/proc/select_initial_lawset()
	var/list/valid_lawsets = list()
	var/list/all_lawsets = subtypesof(/datum/ai_laws)

	for(var/lawset in all_lawsets)
		var/datum/ai_laws/L = lawset
		var/lawset_name = initial(L.name)
		if(initial(L.selectable) && initial(L.benevolent))
			valid_lawsets[lawset_name] += L

	var/choice = input(src, "Initial Lawset", "Initial Lawset") as null|anything in valid_lawsets

	if (laws)
		return


	if(choice)
		var/lawset_path = valid_lawsets[choice]
		laws = new lawset_path()
//multi-z eye
/mob/living/silicon/ai/zMove(dir, feedback = FALSE)
	. = eyeobj.zMove(dir, feedback)
