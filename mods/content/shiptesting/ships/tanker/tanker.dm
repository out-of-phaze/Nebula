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
	warmup_time = 4
	fuel_consumption = 0 // because fuck fuel ports
	current_location = "nav_tanker"
	dock_target = "tanker_dock"
	defer_initialisation = TRUE
	shuttle_area = /area/tanker

/obj/effect/shuttle_landmark/ship/tanker
	landmark_tag = "nav_tanker"
	flags = SLANDMARK_FLAG_ZERO_G
	base_area = /area/space
	base_turf = /turf/space

/area/tanker
	name = "Tanker"
	icon_state = "yellow"

/decl/submap_archetype/spawnable_ship/tanker
	descriptor = "gas tanker"
	map = "Astor-class tanker shuttle"
	crew_jobs = list(
		/datum/job/submap/tanker_pilot,
		/datum/job/submap/tanker_technician
	)

/obj/abstract/submap_landmark/spawnpoint/tanker_pilot_spawn
	name = "Tanker Pilot"

/obj/abstract/submap_landmark/spawnpoint/tanker_technician_spawn
	name = "Tanker Technician"

/obj/abstract/submap_landmark/joinable_submap/tanker
	name = "Astor-class tanker shuttle"
	archetype = /decl/submap_archetype/spawnable_ship/tanker

/datum/job/submap/tanker_pilot
	title = "Tanker Pilot"
	info = "You are the pilot of an Astor-class tanker, ferrying gases in the outer regions of explored space."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/generic/tanker_pilot
	skill_points = 25
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_ADEPT,
		SKILL_ATMOS    = SKILL_BASIC,
		SKILL_PILOT    = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT   = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX
	)

/datum/job/submap/tanker_technician
	title = "Tanker Technician"
	info = "You are the atmospheric technician of an Astor-class tanker, ferrying gases in the outer regions of explored space."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/generic/engineer/tanker_technician
	min_skill = list(
		SKILL_LITERACY     = SKILL_ADEPT,
		SKILL_EVA          = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL   = SKILL_BASIC,
		SKILL_ATMOS        = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL   = SKILL_MAX,
		SKILL_ATMOS        = SKILL_MAX,
		SKILL_ENGINES      = SKILL_MAX
	)
	skill_points = 20

/decl/hierarchy/outfit/job/generic/tanker_pilot
	name = "Job - Tanker pilot"
	uniform = /obj/item/clothing/under/pilot

/decl/hierarchy/outfit/job/generic/engineer/tanker_technician
	name = "Job - Tanker technician"
	uniform = /obj/item/clothing/under/atmospheric_technician
	belt = /obj/item/storage/belt/utility/atmostech
	pda_type = /obj/item/modular_computer/pda/engineering