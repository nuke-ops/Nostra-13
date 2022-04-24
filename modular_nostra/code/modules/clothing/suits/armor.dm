/obj/item/clothing/suit/armor/bamboosamurai
	name = "Bamboo Samurai Armor"
	desc = "Sleek and stirdy armor, able to keep the sharpest of weapons at bay."
	icon = 'modular_nostra/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/suit_digi.dmi'
	icon_state = "bamboouai"
	item_state = "bamboouai"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(MELEE = 65, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 50, WOUND = 35)
	allowed = list(/obj/item/carrotglaive, /obj/item/spear)
	blocks_shove_knockdown = TRUE
	strip_delay = 80
	equip_delay_other = 60
	slowdown = 0

/obj/item/clothing/head/helmet/bamboosamuraihelm
	name = "Bamboo Samurai Helm"
	desc = "A helm, molded to perfect to protect the user from harm while also striking grave fear into there opponent."
	icon_state = "bamboouai"
	item_state = "bamboouai"
	icon = 'modular_nostra/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/head_muzzled.dmi'
	armor = list(MELEE = 55, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 50)
	//flags_inv = null
	strip_delay = 80
	dog_fashion = null
	mutantrace_variation = STYLE_MUZZLE
