/datum/map_template/ship/johnson
	name = "Johnson-class deep space mining vessel"
	suffixes = list("johnson/johnson.dmm")
	area_usage_test_exempted_root_areas = list(/area/johnson)
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/johnson)

/obj/effect/overmap/visitable/ship/landable/spawnable/johnson
	name = "Mining Vessel"
	desc = "Sensors detect a Johnson-class deep space mining vessel."
	shuttle = "Mining Vessel"
	fore_dir = WEST
	max_speed = 1/(3 SECONDS)
	sector_flags = OVERMAP_SECTOR_IN_SPACE
	use_mapped_z_levels = TRUE
	ship_name_classes = list("GENERAL", "SPACE", "NATURAL", "ENGINEERING")

/datum/shuttle/autodock/overmap/johnson
	name = "Mining Vessel"
	warmup_time = 4 // in seconds
	fuel_consumption = 0 // because fuck fuel ports
	current_location = "nav_johnson"
	dock_target = "johnson_dock"
	defer_initialisation = TRUE
	shuttle_area = list(/area/johnson, /area/johnson/bridge, /area/johnson/maintenance, /area/johnson/medical, /area/johnson/mining)
	flags = SHUTTLE_FLAGS_PROCESS

/obj/effect/shuttle_landmark/ship/johnson
	shuttle_name = "Mining Vessel"
	landmark_tag = "nav_johnson"
	flags = SLANDMARK_FLAG_ZERO_G | SLANDMARK_FLAG_REORIENT
	base_area = /area/space
	base_turf = /turf/space

/obj/abstract/docking_port_spawner/johnson
	core_landmark_tag = "nav_johnson"
	docking_tag = "johnson_dock"

/area/johnson
	name = "Mining Vessel"
	icon_state = "yellow"

/area/johnson/bridge
	name = "Mining Vessel Bridge"

/area/johnson/maintenance
	name = "Mining Vessel Maintenance"

/area/johnson/mining
	name = "Mining Vessel Operations Bay"

/area/johnson/medical
	name = "Mining Vessel Infirmary"

/decl/submap_archetype/spawnable_ship/johnson
	descriptor = "Johnson-class mining vessel"
	crew_jobs = list(
		/datum/job/submap/shiptesting/johnson_pilot,
		/datum/job/submap/shiptesting/johnson_medic,
		/datum/job/submap/shiptesting/johnson_technician,
		/datum/job/submap/shiptesting/johnson_crewman,
	)
	whitelisted_species = null
	blacklisted_species = null

/obj/abstract/submap_landmark/spawnpoint/johnson_pilot_spawn
	name = "Mining Vessel Pilot"

/obj/abstract/submap_landmark/spawnpoint/johnson_technician_spawn
	name = "Mining Vessel Technician"

/obj/abstract/submap_landmark/spawnpoint/johnson_crewman_spawn
	name = "Mining Vessel Crewman"

/obj/abstract/submap_landmark/spawnpoint/johnson_medic_spawn
	name = "Mining Vessel Medic"

/obj/abstract/submap_landmark/joinable_submap/spawnable_ship/johnson
	name = "Johnson-class deep space mining vessel"
	archetype = /decl/submap_archetype/spawnable_ship/johnson

/datum/job/submap/shiptesting/johnson_pilot
	title = "Mining Vessel Pilot"
	info = "You are the pilot of a Johnson-class deep space mining vessel, harvesting ore in the outer regions of explored space."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/generic/johnson_pilot
	skill_points = 25
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_ADEPT,
		SKILL_PILOT    = SKILL_EXPERT
	)
	max_skill = list(
		SKILL_PILOT   = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX
	)
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null
	selection_color = "#1d1d4f"

/datum/job/submap/shiptesting/johnson_technician
	title = "Mining Vessel Technician"
	info = "You are the maintenance technician of a Johnson-class deep space mining vessel, harvesting ore in the outer regions of explored space."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/generic/engineer/johnson_technician
	min_skill = list(
		SKILL_LITERACY     = SKILL_BASIC,
		SKILL_EVA          = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL   = SKILL_BASIC,
		SKILL_ATMOS        = SKILL_BASIC,
		SKILL_COMPUTER     = SKILL_BASIC
	)
	max_skill = list(
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL   = SKILL_MAX,
		SKILL_ATMOS        = SKILL_MAX,
		SKILL_ENGINES      = SKILL_MAX
	)
	skill_points = 25
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null
	selection_color = "#7f6e2c"

/datum/job/submap/shiptesting/johnson_crewman
	title = "Mining Vessel Crewman"
	info = "You are a crew member of a Johnson-class deep space mining vessel, harvesting ore in the outer regions of explored space."
	total_positions = 3
	outfit_type = /decl/hierarchy/outfit/job/generic/johnson_mining
	alt_titles = list(
		"Mining Vessel Drill Technician",
		"Mining Vessel Prospector"
	)
	skill_points = 25
	min_skill = list(
		SKILL_LITERACY = SKILL_BASIC,
		SKILL_HAULING  = SKILL_ADEPT,
		SKILL_EVA      = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX
	)
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null

/datum/job/submap/shiptesting/johnson_medic
	title = "Mining Vessel Medic"
	info = "You are the medic of a Johnson-class deep space mining vessel, harvesting ore in the outer regions of explored space."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/generic/doctor/johnson_medic
	skill_points = 25
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA      = SKILL_BASIC,
		SKILL_MEDICAL  = SKILL_BASIC,
		SKILL_ANATOMY  = SKILL_BASIC
	)
	max_skill = list(
		SKILL_MEDICAL   = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX
	)
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null
	selection_color = "#026865"

/decl/hierarchy/outfit/job/generic/johnson_pilot
	name = "Job - Mining vessel pilot"
	uniform = /obj/item/clothing/jumpsuit/pilot
	id_type = /obj/item/card/id/civilian/head
	pda_type = /obj/item/modular_computer/pda/heads/captain
	l_ear = null

/decl/hierarchy/outfit/job/generic/engineer/johnson_technician
	name = "Job - Mining vessel technician"
	uniform = /obj/item/clothing/jumpsuit/engineer
	belt = /obj/item/belt/utility/full
	l_ear = null

/decl/hierarchy/outfit/job/generic/johnson_mining
	name = "Job - Mining vessel shaft miner"
	uniform = /obj/item/clothing/jumpsuit/miner
	pda_type = /obj/item/modular_computer/pda/science
	backpack_contents = list(/obj/item/crowbar = 1, /obj/item/ore = 1)
	outfit_flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	l_ear = null

/decl/hierarchy/outfit/job/generic/johnson_mining/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/generic/doctor/johnson_medic
	name = "Job - Mining vessel medic"
	l_ear = null
