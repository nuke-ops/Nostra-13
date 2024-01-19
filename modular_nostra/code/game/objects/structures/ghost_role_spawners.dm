// Space Police
/obj/effect/mob_spawn/human/spacepolice
	name = "space policeman"
	desc = "A sleeper designed for long-term stasis."
	mob_name = "centcom policeman"
	job_description = "Space Policeman"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	objectives = list("Track down any Syndicate, Wizard Federation or Eldritch Worshippers and eliminate them, but under any circumstances you are not allowed to harm any loyal Employees of Nanotrasen.")
	death = FALSE
	roundstart = FALSE
	random = TRUE
	id_job = "Policeman"
	id_access = "assistant"
	outfit = /datum/outfit/spacepoliceman
	short_desc = "You are an undercover agent assigned by Spearhead Industries tasked with tracking down any Syndicate or Station Threatening Anomalies."
	flavour_text = "You are an agent assigned by Spearhead Industries and tasked with rooting out and eliminating those classified enemies of Central Command such as the Syndicate, Wizard Federation, or worshipers of the Elder Gods Nar'sie and Ratvar. With hopes that our kind deeds to enforce Space Law beyond the borders of Sol will allow us, Spearhead Industries to gain a foot-hold in Nanotrasens Military Operations."
	important_info = "DO NOT HARM ANY LOYAL NANOTRASEN CREW, OR THOSE IN COMMAND HAVE FULL RIGHT FOR YOUR EXTERMINATION"
	assignedrole = "Space Policeman"

/datum/outfit/spacepoliceman
	name = "Space Policeman"
	uniform = /obj/item/clothing/under/rank/security/officer/spacepol
	shoes = /obj/item/clothing/shoes/jackboots
	mask = /obj/item/clothing/mask/gas/sechailer/swat/spacepol
	head = /obj/item/clothing/head/helmet/police
	ears = /obj/item/radio/headset
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	back = /obj/item/tank/internals/oxygen
	belt = /obj/item/gun/energy/e_gun/mini
	suit = /obj/item/clothing/suit/armor/vest/blueshirt
	suit_store = /obj/item/gun/energy/e_gun
	gloves = /obj/item/clothing/gloves/tackler/combat
	id = /obj/item/card/id
	l_pocket = /obj/item/assembly/flash
	r_pocket = /obj/item/restraints/handcuffs
	implants = list(/obj/item/implant/mindshield)

/obj/effect/mob_spawn/human/spacepolice/Destroy()
	new/obj/structure/fluff/empty_sleeper/nanotrasen(get_turf(src))
	return ..()

/obj/effect/mob_spawn/human/spacepolice/special(mob/living/carbon/human/new_spawn)
	ADD_TRAIT(new_spawn,TRAIT_NOCLONE,GHOSTROLE_TRAIT)
	ADD_TRAIT(new_spawn,TRAIT_NO_TELEPORT,GHOSTROLE_TRAIT)
	ADD_TRAIT(new_spawn,TRAIT_RESISTLOWPRESSURE,GHOSTROLE_TRAIT)
	ADD_TRAIT(new_spawn,TRAIT_RESISTCOLD,GHOSTROLE_TRAIT)

//Mad Xenobiologist
/obj/effect/mob_spawn/human/madxenobiologist
	name = "mad xenobiologist"
	desc = "A sleeper designed for long-term stasis."
	mob_name = "mad xenobio"
	job_description = "Mad Xenobiologist"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	//objectives = ""
	death = FALSE
	roundstart = FALSE
	random = TRUE
	id_job = "Scientist"
	id_access = "scientist"
	outfit = /datum/outfit/madxeno
	short_desc = "You are the Mad Xenobiologist."
	flavour_text = "You were a former Nanotrasen employee but due to your insane admiration for your slimes, and recent negotiations with the Animal Rights Consortium, betrayed Nanotrasen. Attempting to flee on a stolen Xenobiology Specialized Prototype Ship, but during your haste your ship's right rear thruster was barely struck by Bluespace Artillery, almost killing you. But by sheer chance you had stolen a single Metal Foam Grenade during your escape, saving you... for now."
	important_info = ""
	assignedrole = "Mad Xenobiologist"
	var/themadspecies

/datum/outfit/madxeno
	name = "Mad Xenobiologist"
	uniform = /obj/item/clothing/under/rank/rnd/scientist
	shoes = /obj/item/clothing/shoes/sneakers/white
	head = /obj/item/clothing/head/soft/purple
	back = /obj/item/storage/backpack/satchel/tox
	suit = /obj/item/clothing/suit/toggle/labcoat
	id = /obj/item/card/id

/obj/effect/mob_spawn/human/madxenobiologist/Destroy()
	new/obj/structure/fluff/empty_sleeper(get_turf(src))
	return ..()

/obj/effect/mob_spawn/human/madxenobiologist/special(mob/living/carbon/human/new_spawn)
	ADD_TRAIT(new_spawn,TRAIT_UNSTABLE,GHOSTROLE_TRAIT)
	to_chat(new_spawn, "<span class='warning'>Objective 1:</span> Get sustainable power to your ship and survive using slimes.")
	to_chat(new_spawn, "<span class='warning'>Objective 2:</span> Spread slimes wherever you can.")
	to_chat(new_spawn, "<span class='warning'>Objective 3:</span> Take revenge upon Nanotrasen, transform them all into [themadspecies] in the name of the ARC and the lack of my sanity! HAHAHAHAHAHAHA!")

// Ultimate Space Gamer
/obj/effect/mob_spawn/human/ultimatespacegamer
	name = "ultimate gamer"
	desc = "A sleeper designed for long-term stasis."
	mob_name = "space gamer ultimate"
	job_description = "Ultimate Space Gamer"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	objectives = list("Be the best there ever was, and kill whoever threatens you superiority within the realm of VR.")
	death = FALSE
	roundstart = FALSE
	random = TRUE
	id_job = "Gamer"
	mob_species = /datum/species/human
	outfit = /datum/outfit/gamergear
	short_desc = "You are the ULTIMATE SPACE GAMER."
	flavour_text = "From the start you were a failure, doomed for nothing but a life of sadness and sorrow. But with new found inspiration found with Donk Corporations and a lifetime supply of Donk Pockets on the line, you knew you were destined for something greater, something.... out of this world, or perhaps..... in another?"
	important_info = ""
	assignedrole = "Ultimate Space Gamer"

/datum/outfit/gamergear
	name = "Ultimate Space Gamer"
	uniform = /obj/item/clothing/under/costume/swagoutfit
	shoes = /obj/item/clothing/shoes/swagshoes
	id = /obj/item/card/id/gold

/obj/effect/mob_spawn/human/ultimatespacegamer/Destroy()
	return ..()

/obj/effect/mob_spawn/human/ultimatespacegamer/special(mob/living/new_spawn)
	var/gamername = pick("xX_RobustClown_Xx","Ninja","Up-Dog","Wohn Jick","Engineer Gaming","icewallowcome","j0e","Xx_ghostasaur_xX", "Donk Co.")
	//new_spawn.real_name = gamername //why this works when moving it from one function to another is beyond me
	var/mob/living/carbon/human/H = new_spawn
	var/obj/item/worn = H.wear_id
	var/obj/item/card/id/id = worn.GetID()
	id.registered_name = gamername
	id.update_label()
	to_chat(new_spawn, "Your goal? Be the best there ever was, beat the VR sleeper game and show your dominance as the ultimate gamer. Plus Donk Co. promised a life time supply of Donk Pockets, be it I kill any NT Employees divulging themselves in the VR world.")

// Comms Agent
/obj/effect/mob_spawn/human/syndicate_agent_base_comms
	name = "Syndicate Telecommunications Agent"
	roundstart = FALSE
	death = FALSE
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	outfit = /datum/outfit/syndicate_empty
	assignedrole = "Syndicate Telecommunications Agent"
	short_desc = "You are a Syndicate Telecommunications Agent"
	flavour_text = "You have been assigned by MI13 in gathering intel about NT's latest technological breakthrough in Xeno-technology. Those slimes are more then Central Commmand is willing to give credit for, and this will bring their end too NT. Ensure no NT thugs come aboard your vessel at all costs."
	important_info = "Do NOT kill the station crew unless your base has been discovered and breached by them."
	objectives = "Gather as much intel about NT's Slime Operations as you can, ensure you and your fellow agent stay undetected."

/obj/effect/mob_spawn/human/syndicate_agent_base_infl
	name = "Syndicate Infiltration Agent"
	roundstart = FALSE
	death = FALSE
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	outfit = /datum/outfit/syndicate_empty
	assignedrole = "Syndicate Infiltration Agent"
	short_desc = "You are a Syndicate Infiltration Agent"
	flavour_text = "You have been assigned by Waffle Co. in infiltrating and retrieving the next generation of weapon development technology. Assure no NT scumbags acknowledge your presence and escape with the valuables in hand. Do not fail us."
	important_info = "Do NOT kill the station crew unless your base has been discovered and breached by them."
	objectives = list("Steal the Captains Antique Lasergun, ensure your presence stays undetected.") //Nostra change - changed into list

/obj/effect/mob_spawn/human/syndicate_agent_base_comms/Destroy()
	return ..()

/obj/effect/mob_spawn/human/syndicate_agent_base_comms/special(mob/living/carbon/human/new_spawn)
	to_chat(new_spawn, "<span class='warning'>Objectives:</span> Gather as much intel about NT's Slime Operations as you can, ensure you and your fellow agent stay undetected.")
