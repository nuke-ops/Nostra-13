/datum/component/storage/proc/set_holdable(can_hold_list, cant_hold_list)
	can_hold_description = generate_hold_desc(can_hold_list)

	if (can_hold_list != null)
		can_hold = string_list(typecacheof(can_hold_list))

	if (cant_hold_list != null)
		cant_hold = string_list(typecacheof(cant_hold_list))

/datum/component/storage/proc/generate_hold_desc(can_hold_list)
	var/list/desc = list()

	for(var/valid_type in can_hold_list)
		var/obj/item/valid_item = valid_type
		desc += "\a [initial(valid_item.name)]"

	return "\n\t<span class='notice'>[desc.Join("\n\t")]</span>"
