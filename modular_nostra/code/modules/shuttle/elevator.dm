/obj/docking_port/mobile/elevator/request(obj/docking_port/stationary/S) //No transit, no ignition, just a simple up/down platform
	initiate_docking(S, TRUE)
	playsound(src, 'sound/machines/elevator_arriving.ogg', 30, 2)
