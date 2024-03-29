/// Whether or not to use the persistence system for cleanable objects
/datum/config_entry/flag/persistent_debris
	default = FALSE

/// Whether or not to nuke all roundstart debris that isn't due to persistence if the above is true
/datum/config_entry/flag/persistent_debris_only
	default = TRUE

/// Max amount of objects to store, total
/datum/config_entry/number/persistent_debris_global_max
	default = 10000
	integer = TRUE

/// Max amount of objects to store per type
/datum/config_entry/number/persistent_debris_type_max
	default = 2000
	integer = TRUE

/// Wipe dirty stuff on nuke
/datum/config_entry/flag/persistent_debris_wipe_on_nuke
