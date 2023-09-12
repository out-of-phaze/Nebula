/obj/effect/shuttle_landmark/outpost_docking
	name = "docking port"
	landmark_tag = "nav_outpost_docking"
	docking_controller = "outpost_docking"
	flags = SLANDMARK_FLAG_REORIENT | SLANDMARK_FLAG_AUTOSET
	var/port_number = 1

/obj/effect/shuttle_landmark/outpost_docking/Initialize()
	landmark_tag = "[landmark_tag]_[port_number]"
	docking_controller = "[docking_controller]_[port_number]"
	return ..()

/obj/effect/shuttle_landmark/outpost_docking/large
	name = "large shuttle docking bay"
	landmark_tag = "nav_outpost_large_docking"
	docking_controller = "outpost_large_docking"

/obj/effect/shuttle_landmark/outpost_docking/small
	name = "small ship docking port"
	landmark_tag = "nav_outpost_small_docking"
	docking_controller = "outpost_small_docking"