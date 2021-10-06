/obj/effect/mob_spawn/human/madxenobiologist/Initialize(mapload)
	. = ..()
	var/list/madspecies = list("Felinids", "Lizards", "Slime People", "Mothmen", "Flypeople", "Arachnids")
	themadspecies = "[pick(madspecies)]"
	objectives = "Transform all Nanotrasen employees into [themadspecies], avoid killing at all costs."
