/obj/item/organ/external/tail/tza
	tail               = "tail"
	tail_icon          = 'mods/crux/icons/species/tza/tail.dmi'
	tail_blend         = ICON_MULTIPLY

/obj/item/organ/external/leg/insectoid/tza_midlimb
	organ_tag          = BP_M_LEG
	joint              = "central hip"
	amputation_point   = "central hip"
	icon_position      = 0

/obj/item/organ/external/foot/insectoid/tza_midlimb
	organ_tag          = BP_M_FOOT
	parent_organ       = BP_M_LEG
	joint              = "central ankle"
	amputation_point   = "central ankle"
	icon_position      = 0

/obj/item/organ/external/arm/insectoid/tza_midlimb
	name               = "central arm"
	joint              = "central shoulder"
	organ_tag          = BP_M_ARM
	amputation_point   = "central shoulder"
	icon_position      = 0

/obj/item/organ/external/hand/insectoid/tza_midlimb
	name               = "central grasper"
	joint              = "central wrist"
	organ_tag          = BP_M_HAND
	parent_organ       = BP_M_ARM
	amputation_point   = "central wrist"
	icon_position      = 0
	gripper_type       = /datum/inventory_slot/gripper/tza_midlimb

/datum/inventory_slot/gripper/tza_midlimb
	slot_name           = "Midlimb"
	slot_id             = BP_M_HAND
	requires_organ_tag  = BP_M_HAND
	ui_label            = "M"
	covering_slot_flags = SLOT_HAND_LEFT|SLOT_HAND_RIGHT
