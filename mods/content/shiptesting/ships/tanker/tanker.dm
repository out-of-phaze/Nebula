/datum/map_template/ship/tanker
	name = "Astor-class tanker shuttle"
	suffixes = list("tanker/tanker.dmm")
	area_usage_test_exempted_root_areas = list(/area/tanker)
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/tanker)

/obj/effect/overmap/visitable/ship/landable/spawnable/tanker
	name = "Tanker"
	desc = "Sensors detect an Astor-class medium-haul gas tanker."
	shuttle = "Tanker"
	fore_dir = WEST
	max_speed = 1/(10 SECOND)
	sector_flags = OVERMAP_SECTOR_IN_SPACE
	use_mapped_z_levels = TRUE

/datum/shuttle/autodock/overmap/tanker
	name = "Tanker"
	warmup_time = 40
	fuel_consumption = 2
	current_location = "nav_tanker"
	dock_target = "tanker_dock"
	defer_initialisation = TRUE
	shuttle_area = /area/tanker

/obj/effect/shuttle_landmark/ship/tanker
	landmark_tag = "nav_tanker"
	flags = SLANDMARK_FLAG_ZERO_G | SLANDMARK_FLAG_REORIENT
	base_area = /area/space
	base_turf = /turf/space

/obj/abstract/docking_port_spawner/tanker
	core_landmark_tag = "nav_tanker"
	docking_tag = "tanker_dock"

/area/tanker
	name = "Tanker"
	icon_state = "yellow"