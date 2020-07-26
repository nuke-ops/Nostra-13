/obj/item/weapon/storage/box/syndicate/New()
	..()
	switch (pickweight(list("bloodyspai" = 3, "stealth" = 2, "bond" = 2, "screwed" = 2, "sabotage" = 3, "guns" = 2, "murder" = 2, "implant" = 1, "hacker" = 3, "lordsingulo" = 1, "darklord" = 1, "sniper" = 1, "metaops" = 1, "ninja" = 1)))
		if("bloodyspai") // 27 tc now this is more right
			new /obj/item/clothing/under/chameleon/(src) // 2 tc since it's not the full set
			new /obj/item/clothing/mask/chameleon(src) // Goes with above
			new /obj/item/card/id/syndicate(src) // 2 tc
			new /obj/item/clothing/shoes/chameleon(src) // 2 tc
			new /obj/item/camera_bug(src) // 1 tc
			new /obj/item/multitool/ai_detect(src) // 1 tc
			new /obj/item/encryptionkey/syndicate(src) // 2 tc
			new /obj/item/reagent_containers/syringe/mulligan(src) // 4 tc
			new /obj/item/switchblade(src) //I'll count this as 2 tc
			new /obj/item/storage/fancy/cigarettes/cigpack_syndicate (src) // 2 tc this shit heals
			new /obj/item/flashlight/emp(src) // 2 tc
			new /obj/item/chameleon(src) // 7 tc
			return
