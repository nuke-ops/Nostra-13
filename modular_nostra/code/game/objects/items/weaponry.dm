/obj/item/melee/flyswatter_syndie
	name = "possessed flysswatter"
	desc = "The ghost of countless flys haunts this swatter, seeking vengeance over the hundreds of Janitors who have done them wrong."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "flyswatter"
	item_state = "flyswatter"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 0
	throwforce = 1
	attack_verb = list("swatted", "smacked")
	hitsound = null
	w_class = WEIGHT_CLASS_SMALL
	//var/list/strong_against

/obj/item/melee/flyswatter_syndie/attack(mob/living/target, mob/living/user)
	. = ..()
	if(!isinsect(target) && !isarachnid(target) && !isflyperson(target))
		target.apply_damage(12, BRUTE)
		target.visible_message("<span class='danger'> [user] swats you with the possessed flyswatter! </span>")
		var/atom/throw_target = get_edge_target_turf(target, get_dir(src, get_step_away(target, src)))
		target.throw_at(throw_target, 1, 1)
		playsound(src, 'modular_nostra/sound/effects/snappossessed.ogg', 75, 1, -2)
	else
		target.apply_damage(-1, OXY)
		target.visible_message("<span class='danger'> [pick("[target] is not our enemy...", "[target] is one of us...", "[target] shall not fall upon our harm...", "We require vengeance, [target] is not our target...")] </span>")
		playsound(src, 'modular_nostra/sound/effects/snapfly.ogg', 10, 1, -1)

/obj/item/claymore/bloodlust
	name = "Bloodlust"
	desc = "You feel the urge to split others in two..."
	icon = 'modular_nostra/icons/obj/items_and_weapons.dmi'
	icon_state = "sundowner_blade"
	item_state = "sundowner_blade"
	lefthand_file = 'modular_nostra/icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'modular_nostra/icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	force = 50
	throwforce = 25
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("attacked", "gashed", "sliced", "carved", "cleaved")
	block_chance = 10
	armour_penetration = 10
	sharpness = SHARP_EDGED
	max_integrity = 500
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100)
	resistance_flags = FIRE_PROOF
	total_mass = TOTAL_MASS_MEDIEVAL_WEAPON

/obj/item/claymore/bloodlust/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 40, 105)
	AddElement(/datum/element/sword_point)

/obj/item/claymore/bloodlust/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is sliding both of [src] blades around there neck! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return(BRUTELOSS)

/obj/item/shield/redshield
	name = "Red Shield"
	desc = "Originally an attachment but detached due too budget cuts."
	icon = 'modular_nostra/icons/obj/items_and_weapons.dmi'
	lefthand_file = 'modular_nostra/icons/mob/inhands/two_handed_left.dmi'
	righthand_file = 'modular_nostra/icons/mob/inhands/two_handed_right.dmi'
	icon_state = "sundowners_shield"
	item_state = "sundowners_shield"
	w_class = WEIGHT_CLASS_HUGE
	armor = list(MELEE = 25, BULLET = 75, LASER = 40, ENERGY = 0, BOMB = 100, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)
	slot_flags = null
	block_chance = 80
	force = 0
	throw_range = 1 //How far do you think you're gonna throw a solid crystalline shield...?
	throw_speed = 1
	attack_verb = list("bashed","pounded","slammed")
	shield_flags = SHIELD_BASH_ALWAYS_KNOCKDOWN
	shieldbash_stamcost = 10
	shieldbash_knockback = 5

/obj/item/shield/redshield/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE, force_wielded=25)
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/shield/redshield/on_active_block(mob/living/owner, atom/object, damage, damage_blocked, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return, override_direction)
	on_shield_block(owner, object, damage, attack_text, attack_type, armour_penetration, attacker, def_zone, final_block_chance)
	if(attack_type & ATTACK_TYPE_PROJECTILE)
		return
	else
		if(iscarbon(attacker))
			var/atom/throw_target = get_edge_target_turf(attacker, get_dir(attacker, get_step_away(attacker, owner)))
			attacker.throw_at(throw_target, 1, 1,owner)

/obj/item/shield/redshield/dropped(mob/user)
	. = ..()
	qdel(src)

/obj/item/claymore/dystopia
	name = "Dystopia"
	desc = "Memes, the embodyment of the soul."
	icon = 'modular_nostra/icons/obj/items_and_weapons.dmi'
	icon_state = "dystopia"
	item_state = "dystopia"
	lefthand_file = 'modular_nostra/icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'modular_nostra/icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	force = 25
	throwforce = 30
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("attacked", "gashed", "sliced", "carved", "cleaved")
	block_chance = 25
	armour_penetration = 25
	sharpness = SHARP_POINTY
	max_integrity = 500
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100)
	resistance_flags = FIRE_PROOF
	total_mass = TOTAL_MASS_MEDIEVAL_WEAPON
	wound_bonus = WOUND_PIERCE


/obj/item/claymore/dystopia/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	var/caught = hit_atom.hitby(src, FALSE, FALSE, throwingdatum=throwingdatum)

	if(thrownby && !caught)
		sleep(1)
		playsound(src, 'sound/weapons/bladeslice.ogg', 50, 1, -2)
		var/mob/living/carbon/H = thrownby
		H.throw_mode_on()
		throw_at(thrownby, 45, throw_speed, null, TRUE)
		. = ..()

/obj/item/claymore/unforgiven
	name = "the unforgiven"
	desc = "You feel betrayed, broken. Have they forgiven you? Will they forgive you!? Your mind spins with anger and confusion..."
	hitsound = 'sound/weapons/sear.ogg'
	force = 35
	throwforce = 15
	slot_flags = ITEM_SLOT_BACK
	attack_verb = list("scorned", "carved", "seared", "sliced", "gashed", "glaved", "gutted")
	block_chance = 30
	max_integrity = 500
	item_flags = SLOWS_WHILE_IN_HAND

/obj/item/claymore/unforgiven/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	AddComponent(/datum/component/butchering, 50, 105)

/obj/item/claymore/unforgiven/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/claymore/unforgiven/process()
	slowdown = -0.2
	if(iscarbon(loc))
		var/mob/living/carbon/wielder = loc
		if(wielder.is_holding(src))
			wielder.update_equipment_speed_mods()
