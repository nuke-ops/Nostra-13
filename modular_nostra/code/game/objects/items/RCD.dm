/obj/item/construction/rcd/suicide_act(mob/living/user)
	var/turf/T = get_turf(user)

	if(!isopenturf(T)) // Oh fuck
		user.visible_message("<span class='suicide'>[user] is beating [user.p_them()]self to death with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		return BRUTELOSS

	mode = RCD_FLOORWALL
	user.visible_message("<span class='suicide'>[user] sets the RCD to 'Wall' and points it down [user.p_their()] throat! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	if(checkResource(16, user)) // It takes 16 resources to construct a wall
		var/success = T.rcd_act(user, src, RCD_FLOORWALL)
		T = get_turf(user)
		// If the RCD placed a floor instead of a wall, having a wall without plating under it is cursed
		// There isn't an easy programmatical way to check if rcd_act will place a floor or a wall, so just repeat using it for free
		if(success && isopenturf(T))
			T.rcd_act(user, src, RCD_FLOORWALL)
		useResource(16, user)
		activate()
		playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
		user.gib()
		return MANUAL_SUICIDE

	user.visible_message("<span class='suicide'>[user] pulls the trigger... But there is not enough ammo!</span>")
	return SHAME

/// Toggles the usage of directional or full tile windows
/obj/item/construction/rcd/proc/toggle_window_size(mob/user)
	if (window_size != RCD_WINDOW_DIRECTIONAL)
		set_window_type(user, window_glass, RCD_WINDOW_DIRECTIONAL)
		return
	set_window_type(user, window_glass, RCD_WINDOW_FULLTILE)

/obj/item/construction/rcd/proc/toggle_silo_link(mob/user)
	if(silo_mats)
		if(!silo_mats.mat_container)
			to_chat(user, "<span class='alert'>No silo link detected. Connect to silo via multitool.</span>")
			return FALSE
		silo_link = !silo_link
		to_chat(user, "<span class='notice'>You change \the [src]'s storage link state: [silo_link ? "ON" : "OFF"].</span>")
	else
		to_chat(user, "<span class='warning'>\the [src] doesn't have remote storage connection.</span>")

/// Radial menu for choosing the object you want to be created with the furnishing mode
/obj/item/construction/rcd/proc/change_furnishing_type(mob/user)
	if(!user)
		return
	var/static/list/choices = list(
		"Chair" = image(icon = 'modular_nostra/icons/mob/radial.dmi', icon_state = "chair"),
		"Stool" = image(icon = 'modular_nostra/icons/mob/radial.dmi', icon_state = "stool"),
		"Table" = image(icon = 'modular_nostra/icons/mob/radial.dmi', icon_state = "table"),
		"Glass Table" = image(icon = 'modular_nostra/icons/mob/radial.dmi', icon_state = "glass_table")
		)
	var/choice = show_radial_menu(user, src, choices, custom_check = CALLBACK(src, .proc/check_menu, user), require_near = TRUE, tooltips = TRUE)
	if(!check_menu(user))
		return
	switch(choice)
		if("Chair")
			furnish_type = /obj/structure/chair
			furnish_cost = 8
			furnish_delay = 10
		if("Stool")
			furnish_type = /obj/structure/chair/stool
			furnish_cost = 8
			furnish_delay = 10
		if("Table")
			furnish_type = /obj/structure/table
			furnish_cost = 16
			furnish_delay = 20
		if("Glass Table")
			furnish_type = /obj/structure/table/glass
			furnish_cost = 16
			furnish_delay = 20
