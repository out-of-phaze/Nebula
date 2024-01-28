/decl/bodytype/yulomnn
	name                   = "humanoid"
	bodytype_category      = BODYTYPE_HUMANOID
	icon_base              = 'mods/crux/icons/species/yulomnn/body.dmi'
	icon_deformed          = 'mods/crux/icons/species/yulomnn/deformed_body.dmi'
	lip_icon               = 'mods/crux/icons/species/yulomnn/lips.dmi'
	blood_overlays         = 'icons/mob/human_races/species/human/blood_overlays.dmi'
	bandages_icon          = 'icons/mob/bandage.dmi'
	limb_icon_intensity    = 0.7
	health_hud_intensity   = 2
	movement_slowdown      = 0.5
	base_color             = "#066000"
	base_hair_color        = "#192e19"
	appearance_flags       = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	eye_darksight_range    = 3
	eye_flash_mod          = 1.2

	override_limb_types = list(BP_TAIL = /obj/item/organ/external/tail/yulomnn)

	default_h_style = /decl/sprite_accessory/hair/yulomnn/frills_long

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

	heat_discomfort_level = 320
	heat_discomfort_strings = list(
		"You feel soothingly warm.",
		"You feel the heat sink into your bones.",
		"You feel warm enough to take a nap."
	)

	cold_discomfort_level = 292
	cold_discomfort_strings = list(
		"You feel chilly.",
		"You feel sluggish and cold.",
		"Your scales bristle against the cold."
	)

/obj/item/organ/external/tail/lizard
	tail_icon = 'mods/crux/icons/species/yulomnn/tail.dmi'
	tail      = "sogtail"
