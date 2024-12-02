//If we intercept it return true else return false
/atom/proc/RelayMouseDrag(atom/src_object, atom/over_object, src_location, over_location, src_control, over_control, params, mob/user)
	return FALSE

/atom/proc/RelayMouseDown(atom/object, location, control, params, mob/user)
	return FALSE

/atom/proc/RelayMouseUp(atom/object, location, control, params, mob/user)
	return FALSE

/mob/proc/update_attack_cursor(obj/item/held)
	if(!client)
		return
	world << "cursor value is [held?.is_charging_attack()]"
	// Updating attack charging indicators.
	switch(held?.is_charging_attack())
		if(1)
			client.add_mouse_pointer(/decl/mouse_pointer/attacking, icon_index = 1)
		if(2)
			client.add_mouse_pointer(/decl/mouse_pointer/attacking, icon_index = 2)
		else
			client.remove_mouse_pointer(/decl/mouse_pointer/attacking)

/mob/proc/OnMouseDrag(atom/src_object, atom/over_object, src_location, over_location, src_control, over_control, params)
	if(loc)
		var/atom/A = loc
		if(A.RelayMouseDrag(src_object, over_object, src_location, over_location, src_control, over_control, params, src))
			return
	var/obj/item/held = get_active_held_item()
	if(istype(held))
		held.handle_mouse_drag(src, over_object, params)
	update_attack_cursor(held)

/mob/proc/OnMouseDown(atom/object, location, control, params)
	if(loc)
		var/atom/A = loc
		if(A.RelayMouseDown(object, location, control, params, src))
			return
	var/obj/item/held = get_active_held_item()
	if(istype(held))
		held.handle_mouse_down(src, object, params)
	update_attack_cursor(held)

/mob/proc/OnMouseUp(atom/object, location, control, params)
	if(loc)
		var/atom/A = loc
		if(A.RelayMouseUp(object, location, control, params, src))
			return
	var/obj/item/held = get_active_held_item()
	if(istype(held))
		held.handle_mouse_up(src, object, params)
	update_attack_cursor(held)
