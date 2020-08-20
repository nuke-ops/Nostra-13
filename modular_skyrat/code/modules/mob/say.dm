/mob/verb/say_special()
	set name = "say_special"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	set_typing_indicator(TRUE)
	hud_typing = TRUE
	var/message = input("", "say (text)") as null|text
	hud_typing = FALSE
	set_typing_indicator(FALSE)
	if(message)
		say(message)


/mob/verb/me_special()
	set name = "me_special"

	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return

	set_typing_indicator(TRUE)
	hud_typing = TRUE
	var/message = input("", "emote (text)") as null|message
	if(message)
		trim(copytext(sanitize(message), 1, MAX_MESSAGE_LEN))
		usr.emote("me",1,message,TRUE)
	hud_typing = FALSE
	set_typing_indicator(FALSE)


