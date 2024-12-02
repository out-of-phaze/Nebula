/obj/item/gun/is_charging_attack()
	return 0

/obj/item/gun/handle_mouse_down(mob/user, atom/object, params)
	SHOULD_CALL_PARENT(FALSE)
	if(user.check_intent(I_FLAG_HARM) && istype(object) && (isturf(object) || isturf(object.loc)) && !user.incapacitated())
		set_autofire(object, user)

/obj/item/gun/handle_mouse_up(mob/user, atom/object, params)
	SHOULD_CALL_PARENT(FALSE)
	clear_autofire()

/obj/item/gun/handle_mouse_drag(mob/user, atom/over_object, params)
	SHOULD_CALL_PARENT(FALSE)
	if(user.check_intent(I_FLAG_HARM) && istype(over_object) && (isturf(over_object) || isturf(over_object.loc)) && !user.incapacitated())
		set_autofire(over_object, user)

/obj/item/gun/proc/set_autofire(var/atom/fire_at, var/mob/fire_by, var/autoturn = TRUE)
	. = TRUE
	if(!istype(fire_at) || !istype(fire_by))
		. = FALSE
	else if(QDELETED(fire_at) || QDELETED(fire_by) || QDELETED(src))
		. = FALSE
	else if(!autofire_enabled)
		. = FALSE
	if(.)
		autofiring_at = fire_at
		autofiring_by = fire_by
		if(!autofiring_timer)
			autofiring_timer = addtimer(CALLBACK(src, PROC_REF(handle_autofire), autoturn), burst_delay, (TIMER_STOPPABLE | TIMER_LOOP | TIMER_UNIQUE | TIMER_OVERRIDE))
	else
		clear_autofire()

/obj/item/gun/proc/clear_autofire()
	autofiring_at = null
	autofiring_by = null
	if(autofiring_timer)
		deltimer(autofiring_timer)
		autofiring_timer = null

/obj/item/gun/proc/handle_autofire(autoturn)
	set waitfor = FALSE
	. = TRUE
	if(QDELETED(autofiring_at) || QDELETED(autofiring_by))
		. = FALSE
	else if(!autofiring_by.can_autofire(src, autofiring_at))
		. = FALSE
	if(!.)
		clear_autofire()
	else if(can_autofire())
		try_autofire(autoturn)

/obj/item/gun/proc/try_autofire(autoturn)
	if(autoturn)
		autofiring_by.set_dir(get_dir(src, autofiring_at))
	Fire(autofiring_at, autofiring_by, null, (get_dist(autofiring_at, autofiring_by) <= 1), FALSE, FALSE)

/obj/item/gun/proc/can_autofire()
	return (autofire_enabled && world.time >= next_fire_time)
