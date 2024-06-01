/obj/item/gun/launcher/bow/attack_self(mob/user)
	if(tension)
		relax_tension(user)
		return TRUE
	if(loaded)
		start_drawing(user)
		return TRUE
	return ..()

/obj/item/gun/launcher/bow/attack_hand(mob/user)
	if(user.is_holding_offhand(src))
		if(tension)
			relax_tension(user)
		if(loaded)
			remove_arrow(user)
		else if(string)
			remove_string(user)
		else
			return ..()
		return TRUE
	return ..()

/obj/item/gun/launcher/bow/proc/remove_string(mob/user)
	if(!string)
		return
	string.dropInto(loc)
	if(user)
		show_string_remove_message(user)
		user.put_in_hands(string)
	string = null

/obj/item/gun/launcher/bow/proc/remove_arrow(mob/user)
	if(user)
		show_unload_message(user)
	if(istype(loaded, /obj/item/arrow))
		var/obj/item/arrow/arrow = loaded
		arrow.removed_from_bow(user)
	if(loaded)
		if(!QDELETED(loaded))
			loaded.dropInto(loc)
			if(user)
				user.put_in_hands(loaded)
		loaded = null
	update_icon()

/obj/item/gun/launcher/bow/proc/relax_tension(mob/user)
	if(user)
		show_string_relax_message(user)
	tension = 0
	update_icon()

/obj/item/gun/launcher/bow/proc/try_string(mob/user, obj/item/bowstring/new_string)
	if(string)
		to_chat(user, SPAN_WARNING("\The [src] is already strung."))
		return TRUE
	if(user.try_unequip(new_string, src))
		string = new_string
		return TRUE
	return FALSE

/obj/item/gun/launcher/bow/attackby(obj/item/W, mob/user)
	if(can_load_arrow(W))
		if(loaded)
			to_chat(user, SPAN_WARNING("\The [src] already has \the [loaded] nocked."))
		else
			load_arrow(user, W)
		return TRUE
	if(istype(W, /obj/item/bowstring) && try_string(user, W))
		return TRUE
	return ..()
