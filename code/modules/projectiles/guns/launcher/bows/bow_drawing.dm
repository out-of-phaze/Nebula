/obj/item/gun/launcher/bow/proc/get_draw_time()
	return draw_time

/obj/item/gun/launcher/bow/proc/check_can_draw(mob/user)
	return istype(user) && !QDELETED(user) && !QDELETED(src) && (loaded || !require_loaded_to_draw)

/obj/item/gun/launcher/bow/proc/start_drawing(var/mob/user)

	if(tension != 0)
		return

	if(!loaded && require_loaded_to_draw)
		to_chat(user, SPAN_WARNING("You don't have anything nocked to \the [src]."))
		return

	if(user.restrained() || tension > 0)
		return

	tension = 1
	update_icon()
	show_draw_message(user)
	if(tension < max_tension)
		continue_drawing(user)

/obj/item/gun/launcher/bow/proc/continue_drawing(mob/user)
	set waitfor = FALSE
	if(!check_can_draw(user) || !user.do_skilled(get_draw_time(), work_skill, src) || !check_can_draw(user))
		tension = 0
		if(user)
			show_cancel_draw_message(user)
	else
		tension++
		if(tension >= max_tension)
			tension = max_tension
			show_max_draw_message(user)
		else
			show_working_draw_message(user)
			continue_drawing(user)
	update_icon()
