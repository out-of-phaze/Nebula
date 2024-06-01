/obj/item/gun/launcher/bow
	name = "bow"
	desc = "A projectile weapon of ancient design that turns elastic tension into long-range death."
	icon = 'icons/obj/guns/launcher/bow.dmi'
	icon_state = ICON_STATE_WORLD
	fire_sound = 'sound/weapons/punchmiss.ogg' // TODO: Decent THWOK noise.
	fire_sound_text = "a solid thunk"
	fire_delay = 25
	slot_flags = SLOT_BACK
	has_safety = FALSE
	material_alteration = MAT_FLAG_ALTERATION_COLOR | MAT_FLAG_ALTERATION_NAME | MAT_FLAG_ALTERATION_DESC
	material = /decl/material/solid/organic/wood/yew

	/// What are we strung with?
	var/obj/item/bowstring/string = /obj/item/bowstring
	/// Currently loaded ammo.
	var/obj/item/loaded
	/// Current draw on the bow.
	var/tension = 0
	/// Highest possible tension.
	var/max_tension = 1
	/// Speed per unit of tension.
	var/release_speed = 10
	/// Time needed to draw the bow back by one "tension"
	var/draw_time = 2 SECONDS
	/// Does this bow need an arrow nocked to draw?
	var/require_loaded_to_draw = TRUE
	/// What skill is used to load and fire this bow?
	var/work_skill = SKILL_WEAPONS
	/// Does this bow keep tension when dropped?
	var/keep_tension_when_dropped = FALSE

/obj/item/gun/launcher/bow/crafted
	string = null

/obj/item/gun/launcher/bow/Initialize()
	if(ispath(string))
		string = new string(src)
	return ..()

/obj/item/gun/launcher/bow/Destroy()
	QDEL_NULL(loaded)
	QDEL_NULL(string)
	return ..()

/obj/item/gun/launcher/bow/physically_destroyed()
	if(loaded)
		loaded.dropInto(loc)
		loaded = null
	if(string)
		string.dropInto(loc)
		string = null
	return ..()

/obj/item/gun/launcher/bow/dropped()
	if(!keep_tension_when_dropped)
		if(tension)
			tension = 0
		if(loaded)
			remove_arrow()
		update_icon()
	return ..()

/obj/item/gun/launcher/bow/on_update_icon()

	. = ..()

	icon_state = get_world_inventory_state()

	if(loaded)
		var/bolt_state = "[icon_state]-loaded"
		if(tension > 1)
			bolt_state = "[bolt_state]-drawn"
		if(check_state_in_icon(bolt_state, icon))
			add_overlay(overlay_image(icon, bolt_state, loaded.color, RESET_COLOR))

	if(string)
		var/string_state = "[icon_state]-string"
		if(tension > 1)
			string_state = "[icon_state]-string-drawn"
		else if(loaded)
			string_state = "[icon_state]-string-nocked"

		if(check_state_in_icon(string_state, icon))
			add_overlay(overlay_image(icon, string_state, string.color, RESET_COLOR))
