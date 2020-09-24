/*

### This file contains a list of all the areas in your station. Format is as follows:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = 'ICON FILENAME' 			(defaults to 'icons/turf/areas.dmi')
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = FALSE 				(defaults to true)
	music = null					(defaults to nothing, look in sound/ambience for music)

NOTE: there are two lists of areas in the end of this file: centcom and station itself. Please maintain these lists valid. --rastaf0

*/


/*-----------------------------------------------------------------------------*/

/area/shuttle/cargo/CargoElevator
	name = "cargo elevator"
	has_gravity = FALSE

//Old Omega

/area/oldomega/HigherHall
	name = "Old station Higher Hall"
	icon_state = "hallC"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/LowerHall
	name = "Old station Lower Hall"
	icon_state = "hallC"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/OldAtmos
	name = "Old station Atmospherics"
	icon_state = "atmos"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/OldMedbay
	name = "Old station Med Bay"
	icon_state = "medbay"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/LowerMaint
	name = "Old station Lower Maintenace"
	icon_state = "maintcentral"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/OldSolars
	name = "Old station Solars"
	icon_state = "yellow"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/HigherMaint
	name = "Old station Higher Maintenace"
	icon_state = "maintcentral"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/TransitCenter
	name = "Old station Transit Center"
	icon_state = "blue"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/OldStorage
	name = "Old station Storage"
	icon_state = "engi_storage"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/OldOffice
	name = "Old station Office"
	icon_state = "blue"
	requires_power = TRUE
	blob_allowed = FALSE

/area/oldomega/OldEngi
	name = "Old station Engineering"
	icon_state = "engine_foyer"
	requires_power = TRUE
	blob_allowed = FALSE
