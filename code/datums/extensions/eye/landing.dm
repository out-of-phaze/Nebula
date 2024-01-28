/datum/extension/eye/landing
	expected_type = /obj/machinery/computer/shuttle_control/explore
	eye_type = /mob/observer/eye/landing

	action_type = /datum/action/eye/landing

/datum/extension/eye/landing/get_eye_turf()
	var/turf/eye_turf = ..()
	var/mob/observer/eye/landing/landing_eye = extension_eye

	return locate(eye_turf.x + landing_eye.x_offset, eye_turf.y + landing_eye.y_offset, eye_turf.z)

/datum/action/eye/landing
	eye_type = /mob/observer/eye/landing
	button_icon = 'icons/obj/action_buttons/landing_buttons.dmi'

/datum/action/eye/landing/finish_landing
	name = "Set landing location"
	procname = "finish_landing"
	button_icon_state = "shuttle_land"
	target_type = HOLDER_TARGET

/datum/action/eye/landing/toggle_offsetting
	name = "Offset landing location"
	procname = "toggle_offsetting"
	button_icon_state = "shuttle_offset"
	target_type = EYE_TARGET

/datum/action/eye/landing/rotate_ccw
	name = "Rotate landing counter-clockwise"
	procname = "turn_shuttle_ccw"
	button_icon_state = "rotate_ccw"
	target_type = EYE_TARGET

/datum/action/eye/landing/rotate_cw
	name = "Rotate landing clockwise"
	procname = "turn_shuttle_cw"
	button_icon_state = "rotate_cw"
	target_type = EYE_TARGET