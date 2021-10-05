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



