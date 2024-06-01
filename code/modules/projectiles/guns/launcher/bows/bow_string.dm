/obj/item/bowstring
	name = "bowstring"
	// TEMP, TODO PROPER ICON
	icon = 'icons/obj/fishing_line.dmi'
	icon_state = ICON_STATE_WORLD
	// END TEMP
	desc = "A flexible length of material used to string bows."
	material = /decl/material/solid/organic/meat/gut
	material_alteration = MAT_FLAG_ALTERATION_NAME | MAT_FLAG_ALTERATION_COLOR | MAT_FLAG_ALTERATION_DESC
	max_health = 100
	w_class = ITEM_SIZE_SMALL

/obj/item/bowstring/Initialize()
	. = ..()
	if(material)
		max_health = max(1, round(initial(max_health) * material.tensile_strength))
		current_health = max_health

/obj/item/bowstring/Destroy()
	if(istype(loc, /obj/item/gun/launcher/bow))
		var/obj/item/gun/launcher/bow/bow = loc
		if(bow.string == src)
			bow.remove_string()
	return ..()

/obj/item/bowstring/synthetic
	material = /decl/material/solid/fiberglass

/obj/item/bowstring/steel
	material = /decl/material/solid/metal/steel
