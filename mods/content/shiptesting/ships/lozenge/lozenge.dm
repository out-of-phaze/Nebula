/datum/map_template/ship/lozenge
	name = "Lozenge-class emergency pod"
	suffixes = list("lozenge/lozenge.dmm")
	area_usage_test_exempted_root_areas = list(/area/lozenge)
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/lozenge)

/obj/effect/overmap/visitable/ship/landable/spawnable/lozenge
	name = "\improper Emergency Pod"
	desc = "Sensors detect a Lozenge-class emergency pod."
	shuttle = "Emergency Pod"
	fore_dir = EAST
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	skill_needed = SKILL_BASIC
	sector_flags = OVERMAP_SECTOR_IN_SPACE
	use_mapped_z_levels = TRUE
	vessel_size = SHIP_SIZE_TINY

/obj/effect/overmap/visitable/ship/landable/spawnable/lozenge/Initialize()
	. = ..()
	SetName(name + " Pod #[add_zero(num2text(rand(1, 12)), 2)]")

/datum/shuttle/autodock/overmap/lozenge
	name = "Emergency Pod"
	warmup_time = 15 // in seconds
	fuel_consumption = 0 // because fuck fuel ports
	current_location = "nav_lozenge"
	dock_target = "lozenge_dock"
	defer_initialisation = TRUE
	shuttle_area = list(/area/lozenge)
	flags = SHUTTLE_FLAGS_PROCESS

/obj/effect/shuttle_landmark/ship/lozenge
	landmark_tag = "nav_lozenge"
	flags = SLANDMARK_FLAG_ZERO_G
	base_area = /area/space
	base_turf = /turf/space

/area/lozenge
	name = "\improper Emergency Pod"
	icon_state = "yellow"

/decl/submap_archetype/spawnable_ship/lozenge
	descriptor = "escape pod"
	map = "Lozenge-class emergency pod"
	crew_jobs = list(
		/datum/job/submap/lozenge_survivor
	)
	whitelisted_species = null
	blacklisted_species = null

/obj/abstract/submap_landmark/spawnpoint/lozenge_survivor
	name = "Escape Pod Survivor"

/obj/abstract/submap_landmark/joinable_submap/spawnable_ship/lozenge
	name = "Lozenge-class emergency pod"
	archetype = /decl/submap_archetype/spawnable_ship/lozenge

/datum/job/submap/lozenge_survivor
	title = "Escape Pod Survivor"
	info = "You are the sole occupant of a Lozenge-class emergency pod, likely having just narrowly escaped a disaster. Now your supplies are dwindling and you need to find a way to survive."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/generic/lozenge_survivor
	skill_points = 25 + 4 // bonus for literacy
	min_skill = list(
		SKILL_LITERACY = SKILL_NONE,
	)
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null

/decl/hierarchy/outfit/job/generic/lozenge_survivor
	name = "Job - Escape pod survivor"
	head = /obj/item/clothing/head/helmet/space/emergency
	suit = /obj/item/clothing/suit/space/emergency
	id_type = null
	pda_type = null
	belt = /obj/item/tank/emergency/oxygen/engi
	l_ear = null
