/decl/bodytype/quadruped/grafadreka
	name                = "Sivian drake"
	icon_base           = 'mods/species/drakes/icons/body.dmi'
	blood_overlays      = 'mods/species/drakes/icons/blood.dmi'
	eye_icon            = 'mods/species/drakes/icons/eyes.dmi'
	icon_template       = 'mods/species/drakes/icons/template.dmi'
	bodytype_category   = BODYTYPE_GRAFADREKA
	eye_blend           = ICON_MULTIPLY
	limb_blend          = ICON_MULTIPLY
	appearance_flags    = HAS_SKIN_COLOR | HAS_EYE_COLOR
	mob_size            = MOB_SIZE_LARGE
	override_limb_types = list(BP_TAIL = /obj/item/organ/external/tail/grafadreka)
	base_color          = "#608894"
	base_eye_color      = COLOR_SILVER
	pixel_offset_x =   -16
	antaghud_offset_x = 16

	default_sprite_accessories = list(
		SAC_MARKINGS = list(
			/decl/sprite_accessory/marking/grafadreka                 = COLOR_BLUE_GRAY,
			/decl/sprite_accessory/marking/grafadreka/bioluminescence = COLOR_CYAN,
			/decl/sprite_accessory/marking/grafadreka/claws           = COLOR_SILVER
		)
	)

/decl/sprite_accessory/marking/grafadreka
	name            = "Drake Spines"
	icon            = 'mods/species/drakes/icons/markings.dmi'
	icon_state      = "spines"
	uid             = "acc_marking_drake_spines"
	species_allowed = list(SPECIES_GRAFADREKA)
	color_blend     = ICON_MULTIPLY
	body_parts      = list(
		BP_CHEST,
		BP_GROIN,
		BP_TAIL,
		BP_HEAD,
		BP_L_ARM,
		BP_R_ARM,
		BP_L_HAND,
		BP_R_HAND,
		BP_L_LEG,
		BP_R_LEG,
		BP_L_FOOT,
		BP_R_FOOT
	)

/decl/sprite_accessory/marking/grafadreka/bioluminescence
	name       = "Drake Bioluminescence"
	uid        = "acc_marking_drake_bioluminescence"
	icon_state = "glow"
	body_parts = list(
		BP_CHEST,
		BP_GROIN,
		BP_TAIL,
		BP_HEAD
	)

/decl/sprite_accessory/marking/grafadreka/claws
	name       = "Drake Claws"
	uid        = "acc_marking_drake_claws"
	icon_state = "claws"
	body_parts = list(
		BP_L_HAND,
		BP_R_HAND,
		BP_L_FOOT,
		BP_R_FOOT
	)

/obj/item/organ/external/tail/grafadreka
	tail       = "tail"
	tail_icon  = 'mods/species/drakes/icons/tail.dmi'
	tail_blend = ICON_MULTIPLY
