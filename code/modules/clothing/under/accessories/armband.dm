/obj/item/clothing/armband
	name = "red armband"
	desc = "A fancy red armband!"
	icon = 'icons/clothing/accessories/armbands/armband_security.dmi'
	bodytype_equip_flags = null
	slot_flags = SLOT_UPPER_BODY
	w_class = ITEM_SIZE_SMALL
	accessory_slot = ACCESSORY_SLOT_ARMBAND
	fallback_slot = slot_w_uniform_str

/obj/item/clothing/armband/get_initial_accessory_hide_on_states()
	var/static/list/initial_accessory_hide_on_states = list(
		/decl/clothing_state_modifier/rolled_down,
		/decl/clothing_state_modifier/rolled_sleeves
	)
	return initial_accessory_hide_on_states

/obj/item/clothing/armband/cargo
	name = "cargo armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is brown."
	icon = 'icons/clothing/accessories/armbands/armband_cargo.dmi'

/obj/item/clothing/armband/science
	name = "science armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is purple."
	icon = 'icons/clothing/accessories/armbands/armband_science.dmi'

/obj/item/clothing/armband/engine
	name = "engineering armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is orange with a reflective strip!"
	icon = 'icons/clothing/accessories/armbands/armband_engineering.dmi'

/obj/item/clothing/armband/hydro
	name = "hydroponics armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is green and blue."
	icon = 'icons/clothing/accessories/armbands/armband_hydroponics.dmi'

/obj/item/clothing/armband/med
	name = "medical armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is white."
	icon = 'icons/clothing/accessories/armbands/armband_medical.dmi'

/obj/item/clothing/armband/medgreen
	name = "EMT armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is white and green."
	icon = 'icons/clothing/accessories/armbands/armband_medical_green.dmi'

/obj/item/clothing/armband/medblue
	name = "medical corps armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is white and blue."
	icon = 'icons/clothing/accessories/armbands/armband_medical_blue.dmi'

/obj/item/clothing/armband/bluegold
	name = "peacekeeper armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is blue and gold."
	icon = 'icons/clothing/accessories/armbands/armband_sol.dmi'
