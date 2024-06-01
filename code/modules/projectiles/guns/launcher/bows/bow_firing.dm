/obj/item/gun/launcher/bow/proc/can_load_arrow(obj/item/ammo)
	return istype(ammo, /obj/item/arrow)

/obj/item/gun/launcher/bow/proc/load_arrow(mob/user, obj/item/ammo)
	if(user && !user.try_unequip(ammo, src))
		return FALSE
	loaded = ammo
	if(user)
		show_load_message(user)
	update_icon()
	return TRUE

/obj/item/gun/launcher/bow/update_release_force()
	release_force = tension * release_speed

/obj/item/gun/launcher/bow/consume_next_projectile(atom/movable/firer)
	if(tension <= 0 && isliving(firer))
		to_chat(firer, SPAN_WARNING("\The [src] is not drawn back!"))
		return null
	return loaded

/obj/item/gun/launcher/bow/handle_post_fire(atom/movable/firer, atom/target)
	loaded = null
	tension = 0
	. = ..()
	update_icon()
