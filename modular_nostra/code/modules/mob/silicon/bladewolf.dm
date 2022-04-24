#define ROLE_BLADEWOLF			"bladewolf"

/datum/antagonist/bladewolf
	name = "Bladewolf"
	show_name_in_check_antagonists = TRUE
	job_rank = ROLE_BLADEWOLF
	show_in_antagpanel = FALSE
	threat = 1
	ui_name = null

/datum/objective/bladewolf
	explanation_text = "Ensure your master is kept alive, and help them with any requests they desire."

/datum/antagonist/bladewolf/proc/forge_objectives()
	var/datum/objective/bladewolf/O
	O = new /datum/objective/bladewolf
	objectives += O

/datum/antagonist/bladewolf/on_gain()
	forge_objectives()
	. = ..()

/obj/item/melee/transforming/energy/sword/cyborg/bladewolfchainsaw //Used by medical Syndicate cyborgs
	name = "heavy chainsaw"
	desc = "A heavy chainsaw detachable from your backside, good for dicing foes."
	force_on = 30
	force = 15
	hitsound = 'modular_nostra/sound/weapons/echainsawhit1.ogg'
	hitsound_on = 'modular_nostra/sound/weapons/echainsawhit1.ogg'
	icon = 'modular_nostra/icons/obj/items_and_weapons.dmi'
	icon_state = "bladechainsaw_off"
	icon_state_on = "bladechainsaw_on"
	sword_color = null //stops icon from breaking when turned on.
	hitcost = 25
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = SHARP_EDGED
	light_color = LIGHT_COLOR_ORANGE
	tool_behaviour = TOOL_SAW
	toolspeed = 0.5

/obj/item/melee/transforming/energy/sword/cyborg/bladewolfchainsaw/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	return NONE


/obj/item/robot_module/bladewolf
	name = "Bladewolf"
	basic_modules = list(
		/obj/item/melee/transforming/energy/sword/cyborg/bladewolfchainsaw,
		/obj/item/crowbar/cyborg)

	ratvar_modules = list(
		/obj/item/clockwork/slab/cyborg/security,
		/obj/item/clockwork/weapon/ratvarian_spear)
	cyborg_base_icon = "bladesec"
	cyborg_icon_override = 'modular_nostra/icons/mob/widerobot.dmi'
	sleeper_overlay = "bladesecsleeper"
	dogborg = TRUE
	hat_offset = 3

/obj/item/robot_module/bladewolf/rebuild_modules()
	..()
	var/mob/living/silicon/robot/bladewolf = loc
	bladewolf.faction  -= "silicon" //ai turrets

/obj/item/robot_module/bladewolf/remove_module(obj/item/I, delete_after)
	..()
	var/mob/living/silicon/robot/bladewolf = loc
	bladewolf.faction += "silicon" //ai is your bff now!


/mob/living/silicon/robot/modules/bladewolf
	name = "IF Prototype LQ-84i"
	real_name = "IF Prototype LQ-84i"
	icon = 'modular_nostra/icons/mob/widerobot.dmi'
	icon_state = "bladesec-b"
	faction = list(ROLE_SYNDICATE)
	bubble_icon = "bladesec-b"
	req_access = list(ACCESS_SYNDICATE)
	lawupdate = FALSE
	scrambledcodes = TRUE // These are rogue borgs.
	ionpulse = TRUE
	var/playstyle_string = "<span class='big bold'>You are IF Prototype LQ-84i!</span><br>\
							<b>You duty is to serve your master and do there bidding. \
							You come armed with a devastating chainsaw should your master succumb too danger. \
							<i>Help your master complete there objectives!</i></b>"
	set_module = /obj/item/robot_module/bladewolf
	cell = /obj/item/stock_parts/cell/hyper
	// radio = /obj/item/radio/borg/syndicate

/mob/living/silicon/robot/modules/bladewolf/Initialize()
	. = ..()
	radio = new /obj/item/radio/borg(src)
	laws = new /datum/ai_laws/syndicate_override()
	addtimer(CALLBACK(src, .proc/show_playstyle), 5)

/mob/living/silicon/robot/modules/bladewolf/create_modularInterface()
	if(!modularInterface)
		modularInterface = new /obj/item/modular_computer/tablet/integrated/syndicate(src)
	return ..()

/mob/living/silicon/robot/modules/bladewolf/proc/show_playstyle()
	if(playstyle_string)
		to_chat(src, playstyle_string)

/mob/living/silicon/robot/modules/bladewolf/ResetModule()
	return

/obj/item/antag_spawner/bladewolf
	name = "IF Prototype Assistance Teleporter"
	desc = "A single-use teleporter designed to quickly call for assistance."
	icon = 'icons/obj/device.dmi'
	icon_state = "locator"
	var/next_attempt_allowed

/obj/item/antag_spawner/bladewolf/proc/check_usability(mob/user)
	if(used)
		to_chat(user, "<span class='warning'>[src] is out of power!</span>")
		return FALSE

/obj/item/antag_spawner/bladewolf/attack_self(mob/user)
	if(!(next_attempt_allowed < world.time))
		to_chat(user, "<span class='warning'>A request has already been sent! Wait 1 minute.</span>")
		return
	next_attempt_allowed = world.time + 1 MINUTES

	to_chat(user, "<span class='notice'>You activate [src] and wait for confirmation.</span>")
	var/list/bladewolf_candidates = pollGhostCandidates("Do you want to play as an IF Prototype LQ-84i?", ROLE_BLADEWOLF, null, FALSE, 150)
	if(LAZYLEN(bladewolf_candidates))
		used = TRUE
		var/mob/dead/observer/G = pick(bladewolf_candidates)
		spawn_antag(G.client, get_turf(src), "Bladewolf", user.mind)
		do_sparks(4, TRUE, src)
		qdel(src)
	else
		to_chat(user, "<span class='warning'>Unable to connect to Desperado LLC. Please wait and try again later.</span>")

/obj/item/antag_spawner/bladewolf/spawn_antag(client/C, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/R

	R = new /mob/living/silicon/robot/modules/bladewolf(T) //Assault borg by default

	R.mmi.name = "Man-Machine Interface: Bladewolf"
	R.mmi.brain.name = "Bladewolf's brain"
	R.mmi.brainmob.real_name = "IF Prototype LQ-84i"
	R.mmi.brainmob.name = "IF Prototype LQ-84i"
	R.real_name = R.name

	R.key = C.key

	var/datum/antagonist/bladewolf/new_borg = new()
	//new_borg.send_to_spawnpoint = FALSE
	R.mind.add_antag_datum(new_borg)
	R.mind.special_role = "Bladewolf"
