/obj/item/weapon/storage/box/syndicate/New()
	..()
	switch (pickweight(list("bloodyspai" = 3, "stealth" = 2, "bond" = 2, "screwed" = 2, "sabotage" = 3, "guns" = 2, "murder" = 2, "implant" = 1, "hacker" = 3, "lordsingulo" = 1, "darklord" = 1, "sniper" = 1, "metaops" = 1, "ninja" = 1)))
		if("bloodyspai") // 27 tc now this is more right
			new /obj/item/clothing/under/chameleon(src) // 2 tc since it's not the full set
			new /obj/item/clothing/mask/chameleon(src) // Goes with above
			new /obj/item/weapon/card/id/syndicate(src) // 2 tc
			new /obj/item/clothing/shoes/chameleon(src) // 2 tc
			new /obj/item/device/camera_bug(src) // 1 tc
			new /obj/item/device/multitool/ai_detect(src) // 1 tc
			new /obj/item/device/encryptionkey/syndicate(src) // 2 tc
			new /obj/item/weapon/reagent_containers/syringe/mulligan(src) // 4 tc
			new /obj/item/weapon/switchblade(src) //I'll count this as 2 tc
			new /obj/item/weapon/storage/fancy/cigarettes/cigpack_syndicate (src) // 2 tc this shit heals
			new /obj/item/device/flashlight/emp(src) // 2 tc
			new /obj/item/device/chameleon(src) // 7 tc
			return