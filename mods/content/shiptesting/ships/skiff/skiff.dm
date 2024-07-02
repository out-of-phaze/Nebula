/datum/map_template/ship/skiff
	name = "Gravedigger-class mining skiff"
	suffixes = list("skiff/skiff.dmm")
	area_usage_test_exempted_root_areas = list(/area/skiff)
	apc_test_exempt_areas = list(
		/area/skiff = NO_VENT|NO_SCRUBBER // it literally has no air.
	)
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/skiff)

/obj/effect/overmap/visitable/ship/landable/spawnable/skiff
	name = "\improper Mining Skiff"
	desc = "Sensors detect a Gravedigger-class mining skiff."
	shuttle = "Mining Skiff"
	fore_dir = EAST
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECOND
	skill_needed = SKILL_BASIC
	sector_flags = OVERMAP_SECTOR_IN_SPACE
	use_mapped_z_levels = TRUE
	vessel_size = SHIP_SIZE_TINY
	ship_name_classes = list("GENERAL", "PIRATES", "BRITISH_NAVY", "REVOLUTIONARY", "SPACE")

/datum/shuttle/autodock/overmap/skiff
	name = "Mining Skiff"
	warmup_time = 15 // in seconds
	fuel_consumption = 0 // because fuck fuel ports
	current_location = "nav_skiff"
	dock_target = "skiff_dock"
	defer_initialisation = TRUE
	shuttle_area = list(/area/skiff)
	flags = SHUTTLE_FLAGS_PROCESS

/obj/effect/shuttle_landmark/ship/skiff
	shuttle_name = "Mining Skiff"
	landmark_tag = "nav_skiff"
	flags = SLANDMARK_FLAG_ZERO_G | SLANDMARK_FLAG_REORIENT
	base_area = /area/space
	base_turf = /turf/space

/obj/abstract/docking_port_spawner/skiff_port
	port_name = "port docking port"
	core_landmark_tag = "nav_skiff"

/obj/abstract/docking_port_spawner/skiff_starboard
	port_name = "starboard docking port"
	core_landmark_tag = "nav_skiff"

/area/skiff
	name = "\improper Mining Skiff"
	icon_state = "yellow"

/decl/submap_archetype/spawnable_ship/skiff
	descriptor = "Gravedigger-class mining skiff"
	crew_jobs = list(
		/datum/job/submap/shiptesting/skiff_operator
	)
	whitelisted_species = null
	blacklisted_species = null

/obj/abstract/submap_landmark/spawnpoint/skiff_operator
	name = "Mining Skiff Operator"

/obj/abstract/submap_landmark/joinable_submap/spawnable_ship/skiff
	name = "Gravedigger-class mining skiff"
	archetype = /decl/submap_archetype/spawnable_ship/skiff

/datum/job/submap/shiptesting/skiff_operator
	title = "Mining Skiff Operator"
	info = "You are the sole operator of a Gravedigger-class mining skiff, often piloted by convicts or the desperate. Without even walls or floors to protect you from the harsh vacuum of space, it will be difficult for you to survive."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/generic/skiff_operator
	alt_titles = list(
		"Mining Skiff Convict" = /decl/hierarchy/outfit/job/generic/skiff_operator/convict
	)
	skill_points = 30 + 4 // bonus for literacy
	min_skill = list(
		SKILL_LITERACY = SKILL_NONE,
	)
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null
	no_warn_unsafe = TRUE // will always be 0kPa

/decl/hierarchy/outfit/job/generic/skiff_operator/post_equip(mob/living/human/H)
	. = ..()
	H.set_internals_to_best_available_tank()

/decl/hierarchy/outfit/job/generic/skiff_operator
	name = "Job - Mining skiff operator"
	head = /obj/item/clothing/head/helmet/space/emergency
	mask = /obj/item/clothing/mask/breath/scba
	suit = /obj/item/clothing/suit/space/emergency
	id_type = null
	pda_type = null
	back = /obj/item/tank/oxygen
	l_ear = null

/decl/hierarchy/outfit/job/generic/skiff_operator/convict
	name = "Job - Mining skiff convict"
	uniform = /obj/item/clothing/under/color/orange
	back = /obj/item/tank/oxygen/yellow