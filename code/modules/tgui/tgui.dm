/**
<<<<<<< HEAD
 * Copyright (c) 2020 Aleksej Komarov
 * SPDX-License-Identifier: MIT
=======
 * tgui
 *
 * /tg/station user interface library
>>>>>>> master
 */

/**
 * tgui datum (represents a UI).
 */
/datum/tgui
	/// The mob who opened/is using the UI.
	var/mob/user
	/// The object which owns the UI.
	var/datum/src_object
	/// The title of te UI.
	var/title
	/// The window_id for browse() and onclose().
<<<<<<< HEAD
	var/datum/tgui_window/window
	/// Key that is used for remembering the window geometry.
	var/window_key
	/// Deprecated: Window size.
	var/window_size
=======
	var/window_id
	/// The window width.
	var/width = 0
	/// The window height
	var/height = 0
>>>>>>> master
	/// The interface (template) to be used for this UI.
	var/interface
	/// Update the UI every MC tick.
	var/autoupdate = TRUE
	/// If the UI has been initialized yet.
	var/initialized = FALSE
<<<<<<< HEAD
	/// Time of opening the window.
	var/opened_at
	/// Stops further updates when close() was called.
	var/closing = FALSE
=======
	/// The data (and datastructure) used to initialize the UI.
	var/list/initial_data
	/// The static data used to initialize the UI.
	var/list/initial_static_data
	/// Holder for the json string, that is sent during the initial update
	var/_initial_update
>>>>>>> master
	/// The status/visibility of the UI.
	var/status = UI_INTERACTIVE
	/// Topic state used to determine status/interactability.
	var/datum/ui_state/state = null
<<<<<<< HEAD
=======
	/// The parent UI.
	var/datum/tgui/master_ui
	/// Children of this UI.
	var/list/datum/tgui/children = list()
>>>>>>> master

/**
 * public
 *
 * Create a new UI.
 *
 * required user mob The mob who opened/is using the UI.
 * required src_object datum The object or datum which owns the UI.
<<<<<<< HEAD
 * required interface string The interface used to render the UI.
 * optional title string The title of the UI.
 * optional ui_x int Deprecated: Window width.
 * optional ui_y int Deprecated: Window height.
 *
 * return datum/tgui The requested UI.
 */
/datum/tgui/New(mob/user, datum/src_object, interface, title, ui_x, ui_y)
	log_tgui(user, "new [interface] fancy [user.client.prefs.tgui_fancy]")
	src.user = user
	src.src_object = src_object
	src.window_key = "[REF(src_object)]-main"
	src.interface = interface
	if(title)
		src.title = title
	src.state = src_object.ui_state()
	// Deprecated
	if(ui_x && ui_y)
		src.window_size = list(ui_x, ui_y)
=======
 * required ui_key string The ui_key of the UI.
 * required interface string The interface used to render the UI.
 * optional title string The title of the UI.
 * optional width int The window width.
 * optional height int The window height.
 * optional master_ui datum/tgui The parent UI.
 * optional state datum/ui_state The state used to determine status.
 *
 * return datum/tgui The requested UI.
 */
/datum/tgui/New(mob/user, datum/src_object, ui_key, interface, title, width = 0, height = 0, datum/tgui/master_ui = null, datum/ui_state/state = GLOB.default_state)
	src.user = user
	src.src_object = src_object
	src.ui_key = ui_key
	// DO NOT replace with \ref here. src_object could potentially be tagged
	src.window_id = "[REF(src_object)]-[ui_key]"
	src.interface = interface

	if(title)
		src.title = sanitize(title)
	if(width)
		src.width = width
	if(height)
		src.height = height

	src.master_ui = master_ui
	if(master_ui)
		master_ui.children += src
	src.state = state

	var/datum/asset/assets = get_asset_datum(/datum/asset/group/tgui)
	assets.send(user)
>>>>>>> master

/**
 * public
 *
 * Open this UI (and initialize it with data).
 */
/datum/tgui/proc/open()
	if(!user.client)
		return null
	if(window)
		return null
	process_status()
	if(status < UI_UPDATE)
<<<<<<< HEAD
		return null
	window = SStgui.request_pooled_window(user)
	if(!window)
		return null
	opened_at = world.time
	window.acquire_lock(src)
	if(!window.is_ready())
		window.initialize(inline_assets = list(
			get_asset_datum(/datum/asset/simple/tgui),
		))
	else
		window.send_message("ping")
	window.send_asset(get_asset_datum(/datum/asset/simple/fontawesome))
	for(var/datum/asset/asset in src_object.ui_assets(user))
		window.send_asset(asset)
	window.send_message("update", get_payload(
		with_data = TRUE,
		with_static_data = TRUE))
=======
		return // Bail if we're not supposed to open.

	// Build window options
	var/window_options = "can_minimize=0;auto_format=0;"
	// If we have a width and height, use them.
	if(width && height)
		window_options += "size=[width]x[height];"
	// Remove titlebar and resize handles for a fancy window
	if(user.client.prefs.tgui_fancy)
		window_options += "titlebar=0;can_resize=0;"
	else
		window_options += "titlebar=1;can_resize=1;"

	// Generate page html
	var/html
	html = SStgui.basehtml
	// Allow the src object to override the html if needed
	html = src_object.ui_base_html(html)
	// Replace template tokens with important UI data
	// NOTE: Intentional \ref usage; tgui datums can't/shouldn't
	// be tagged, so this is an effective unwrap
	html = replacetextEx(html, "\[tgui:ref]", "\ref[src]")

	// Open the window.
	user << browse(html, "window=[window_id];[window_options]")

	// Instruct the client to signal UI when the window is closed.
	// NOTE: Intentional \ref usage; tgui datums can't/shouldn't
	// be tagged, so this is an effective unwrap
	winset(user, window_id, "on-close=\"uiclose \ref[src]\"")

	// Pre-fetch initial state while browser is still loading in
	// another thread
	if(!initial_data) {
		initial_data = src_object.ui_data(user)
	}
	if(!initial_static_data) {
		initial_static_data = src_object.ui_static_data(user)
	}
	_initial_update = url_encode(get_json(initial_data, initial_static_data))

>>>>>>> master
	SStgui.on_open(src)

/**
 * public
 *
<<<<<<< HEAD
 * Close the UI.
 *
 * optional can_be_suspended bool
 */
/datum/tgui/proc/close(can_be_suspended = TRUE)
	if(closing)
		return
	closing = TRUE
	// If we don't have window_id, open proc did not have the opportunity
	// to finish, therefore it's safe to skip this whole block.
	if(window)
		// Windows you want to keep are usually blue screens of death
		// and we want to keep them around, to allow user to read
		// the error message properly.
		window.release_lock()
		window.close(can_be_suspended)
		src_object.ui_close(user)
		SStgui.on_close(src)
=======
 * Reinitialize the UI.
 * (Possibly with a new interface and/or data).
 *
 * optional template string The name of the new interface.
 * optional data list The new initial data.
 */
/datum/tgui/proc/reinitialize(interface, list/data, list/static_data)
	if(interface)
		src.interface = interface
	if(data)
		initial_data = data
	if(static_data)
		initial_static_data = static_data
	open()

/**
 * public
 *
 * Close the UI, and all its children.
 */
/datum/tgui/proc/close()
	user << browse(null, "window=[window_id]") // Close the window.
	src_object.ui_close(user)
	SStgui.on_close(src)
	for(var/datum/tgui/child in children) // Loop through and close all children.
		child.close()
	children.Cut()
>>>>>>> master
	state = null
	qdel(src)

/**
 * public
 *
 * Enable/disable auto-updating of the UI.
 *
<<<<<<< HEAD
 * required value bool Enable/disable auto-updating.
 */
/datum/tgui/proc/set_autoupdate(autoupdate)
	src.autoupdate = autoupdate

/**
 * public
 *
 * Replace current ui.state with a new one.
 *
 * required state datum/ui_state/state Next state
 */
/datum/tgui/proc/set_state(datum/ui_state/state)
	src.state = state

/**
 * public
 *
 * Makes an asset available to use in tgui.
 *
 * required asset datum/asset
 */
/datum/tgui/proc/send_asset(datum/asset/asset)
	if(!window)
		CRASH("send_asset() can only be called after open().")
	window.send_asset(asset)

/**
 * public
 *
 * Send a full update to the client (includes static data).
 *
 * optional custom_data list Custom data to send instead of ui_data.
 * optional force bool Send an update even if UI is not interactive.
 */
/datum/tgui/proc/send_full_update(custom_data, force)
	if(!user.client || !initialized || closing)
		return
	var/should_update_data = force || status >= UI_UPDATE
	window.send_message("update", get_payload(
		custom_data,
		with_data = should_update_data,
		with_static_data = TRUE))

/**
 * public
 *
 * Send a partial update to the client (excludes static data).
 *
 * optional custom_data list Custom data to send instead of ui_data.
 * optional force bool Send an update even if UI is not interactive.
 */
/datum/tgui/proc/send_update(custom_data, force)
	if(!user.client || !initialized || closing)
		return
	var/should_update_data = force || status >= UI_UPDATE
	window.send_message("update", get_payload(
		custom_data,
		with_data = should_update_data))

/**
 * private
 *
 * Package the data to send to the UI, as JSON.
 *
 * return list
 */
/datum/tgui/proc/get_payload(custom_data, with_data, with_static_data)
=======
 * required state bool Enable/disable auto-updating.
 */
/datum/tgui/proc/set_autoupdate(state = TRUE)
	autoupdate = state

/**
 * private
 *
 * Package the data to send to the UI, as JSON.
 * This includes the UI data and config_data.
 *
 * return string The packaged JSON.
 */
/datum/tgui/proc/get_json(list/data, list/static_data)
>>>>>>> master
	var/list/json_data = list()
	json_data["config"] = list(
		"title" = title,
		"status" = status,
		"interface" = interface,
<<<<<<< HEAD
		"window" = list(
			"key" = window_key,
			"size" = window_size,
			"fancy" = user.client.prefs.tgui_fancy,
			"locked" = user.client.prefs.tgui_lock
		),
		"user" = list(
			"name" = "[user]",
			"ckey" = "[user.ckey]",
			"observer" = isobserver(user)
		)
	)
	var/data = custom_data || with_data && src_object.ui_data(user)
	if(data)
=======
		"fancy" = user.client.prefs.tgui_fancy,
		"locked" = user.client.prefs.tgui_lock,
		"observer" = isobserver(user),
		"window" = window_id,
		// NOTE: Intentional \ref usage; tgui datums can't/shouldn't
		// be tagged, so this is an effective unwrap
		"ref" = "\ref[src]"
	)

	if(!isnull(data))
>>>>>>> master
		json_data["data"] = data
	var/static_data = with_static_data && src_object.ui_static_data(user)
	if(static_data)
		json_data["static_data"] = static_data
<<<<<<< HEAD
	if(src_object.tgui_shared_states)
		json_data["shared"] = src_object.tgui_shared_states
	return json_data
=======

	// Send shared states
	if(src_object.tgui_shared_states)
		json_data["shared"] = src_object.tgui_shared_states

	// Generate the JSON.
	var/json = json_encode(json_data)
	// Strip #255/improper.
	json = replacetext(json, "\proper", "")
	json = replacetext(json, "\improper", "")
	return json

/**
 * private
 *
 * Handle clicks from the UI.
 * Call the src_object's ui_act() if status is UI_INTERACTIVE.
 * If the src_object's ui_act() returns 1, update all UIs attacked to it.
 */
/datum/tgui/Topic(href, href_list)
	if(user != usr)
		return // Something is not right here.

	var/action = href_list["action"]
	var/params = href_list; params -= "action"

	switch(action)
		if("tgui:initialize")
			user << output(_initial_update, "[window_id].browser:update")
			initialized = TRUE
		if("tgui:setSharedState")
			// Update the window state.
			update_status(push = FALSE)
			// Bail if UI is not interactive or usr calling Topic
			// is not the UI user.
			if(status != UI_INTERACTIVE)
				return
			var/key = params["key"]
			var/value = params["value"]
			if(!src_object.tgui_shared_states)
				src_object.tgui_shared_states = list()
			src_object.tgui_shared_states[key] = value
			SStgui.update_uis(src_object)
		if("tgui:setFancy")
			var/value = text2num(params["value"])
			user.client.prefs.tgui_fancy = value
		if("tgui:log")
			// Force window to show frills on fatal errors
			if(params["fatal"])
				winset(user, window_id, "titlebar=1;can-resize=1;size=600x600")
			log_message(params["log"])
		if("tgui:link")
			user << link(params["url"])
		else
			// Update the window state.
			update_status(push = FALSE)
			// Call ui_act() on the src_object.
			if(src_object.ui_act(action, params, src, state))
				// Update if the object requested it.
				SStgui.update_uis(src_object)
>>>>>>> master

/**
 * private
 *
<<<<<<< HEAD
 * Run an update cycle for this UI. Called internally by SStgui
 * every second or so.
=======
 * Update the UI.
 * Only updates the data if update is true, otherwise only updates the status.
 *
 * optional force bool If the UI should be forced to update.
>>>>>>> master
 */
/datum/tgui/process(force = FALSE)
	if(closing)
		return
	var/datum/host = src_object.ui_host(user)
	// If the object or user died (or something else), abort.
	if(!src_object || !host || !user || !window)
		close(can_be_suspended = FALSE)
		return
<<<<<<< HEAD
	// Validate ping
	if(!initialized && world.time - opened_at > TGUI_PING_TIMEOUT)
		log_tgui(user, \
			"Error: Zombie window detected, killing it with fire.\n" \
			+ "window_id: [window.id]\n" \
			+ "opened_at: [opened_at]\n" \
			+ "world.time: [world.time]")
		close(can_be_suspended = FALSE)
		return
	// Update through a normal call to ui_interact
	if(status != UI_DISABLED && (autoupdate || force))
		src_object.ui_interact(user, src)
		return
	// Update status only
	var/needs_update = process_status()
	if(status <= UI_CLOSE)
		close()
		return
	if(needs_update)
		window.send_message("update", get_payload())
=======

	if(status && (force || autoupdate))
		update() // Update the UI if the status and update settings allow it.
	else
		update_status(push = TRUE) // Otherwise only update status.

/**
 * private
 *
 * Push data to an already open UI.
 *
 * required data list The data to send.
 * optional force bool If the update should be sent regardless of state.
 */
/datum/tgui/proc/push_data(data, static_data, force = FALSE)
	// Update the window state.
	update_status(push = FALSE)
	// Cannot update UI if it is not set up yet.
	if(!initialized)
		return
	// Cannot update UI, we have no visibility.
	if(status <= UI_DISABLED && !force)
		return
	// Send the new JSON to the update() Javascript function.
	user << output(
		url_encode(get_json(data, static_data)),
		"[window_id].browser:update")

/**
 * private
 *
 * Updates the UI by interacting with the src_object again, which will hopefully
 * call try_ui_update on it.
 *
 * optional force_open bool If force_open should be passed to ui_interact.
 */
/datum/tgui/proc/update(force_open = FALSE)
	src_object.ui_interact(user, ui_key, src, force_open, master_ui, state)

/**
 * private
 *
 * Update the status/visibility of the UI for its user.
 *
 * optional push bool Push an update to the UI (an update is always sent for UI_DISABLED).
 */
/datum/tgui/proc/update_status(push = FALSE)
	var/status = src_object.ui_status(user, state)
	if(master_ui)
		status = min(status, master_ui.status)
	set_status(status, push)
	if(status == UI_CLOSE)
		close()
>>>>>>> master

/**
 * private
 *
<<<<<<< HEAD
 * Updates the status, and returns TRUE if status has changed.
 */
/datum/tgui/proc/process_status()
	var/prev_status = status
	status = src_object.ui_status(user, state)
	return prev_status != status

/**
 * private
 *
 * Callback for handling incoming tgui messages.
 */
/datum/tgui/proc/on_message(type, list/payload, list/href_list)
	// Pass act type messages to ui_act
	if(type && copytext(type, 1, 5) == "act/")
		process_status()
		if(src_object.ui_act(copytext(type, 5), payload, src, state))
			SStgui.update_uis(src_object)
		return FALSE
	switch(type)
		if("ready")
			initialized = TRUE
		if("pingReply")
			initialized = TRUE
		if("suspend")
			close(can_be_suspended = TRUE)
		if("close")
			close(can_be_suspended = FALSE)
		if("log")
			if(href_list["fatal"])
				close(can_be_suspended = FALSE)
		if("setSharedState")
			if(status != UI_INTERACTIVE)
				return
			LAZYINITLIST(src_object.tgui_shared_states)
			src_object.tgui_shared_states[href_list["key"]] = href_list["value"]
			SStgui.update_uis(src_object)
=======
 * Set the status/visibility of the UI.
 *
 * required status int The status to set (UI_CLOSE/UI_DISABLED/UI_UPDATE/UI_INTERACTIVE).
 * optional push bool Push an update to the UI (an update is always sent for UI_DISABLED).
 */
/datum/tgui/proc/set_status(status, push = FALSE)
	// Only update if status has changed.
	if(src.status != status)
		if(src.status == UI_DISABLED)
			src.status = status
			if(push)
				update()
		else
			src.status = status
			// Update if the UI just because disabled, or a push is requested.
			if(status == UI_DISABLED || push)
				push_data(null, force = TRUE)

/datum/tgui/proc/log_message(message)
	log_tgui("[user] ([user.ckey]) using \"[title]\":\n[message]")
>>>>>>> master
