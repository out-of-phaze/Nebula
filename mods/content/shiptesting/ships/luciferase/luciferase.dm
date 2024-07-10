/datum/map_template/ship/luciferase
	name = "Luciferase-class prototype engineering vessel"
	suffixes = list("luciferase/luciferase.dmm")
	area_usage_test_exempted_root_areas = list(/area/luciferase)
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/luciferase)

/obj/effect/overmap/visitable/ship/landable/spawnable/luciferase
	name = "Prototype Vessel"
	desc = "Sensors detect a Luciferase-class prototype engineering vessel. Potential radiation hazard."
	shuttle = "Prototype Vessel"
	fore_dir = WEST
	max_speed = 1/(3 SECONDS)
	sector_flags = OVERMAP_SECTOR_IN_SPACE
	use_mapped_z_levels = TRUE
	ship_name_classes = list("GENERAL", "SPACE", "NATURAL_AGGRESSIVE", "ENGINEERING", "REVOLUTIONARY")

/datum/shuttle/autodock/overmap/luciferase
	name = "Prototype Vessel"
	warmup_time = 4 // in seconds
	fuel_consumption = 0 // because fuck fuel ports
	current_location = "nav_luciferase"
	dock_target = "luciferase_dock"
	defer_initialisation = TRUE
	shuttle_area = list(
		/area/luciferase/bridge/port,
		/area/luciferase/bridge/starboard,
		/area/luciferase/atmos,
		/area/luciferase/engine,
		/area/luciferase/maint,
		/area/luciferase/electrical,
		/area/luciferase/cryo,
		/area/luciferase/mess,
		/area/luciferase/engineering_equipmentroom,
		/area/luciferase/infirmary,
		/area/luciferase/cargo
	)
	flags = SHUTTLE_FLAGS_PROCESS

/obj/effect/shuttle_landmark/ship/luciferase
	shuttle_name = "Prototype Vessel"
	landmark_tag = "nav_luciferase"
	flags = SLANDMARK_FLAG_ZERO_G | SLANDMARK_FLAG_REORIENT
	base_area = /area/space
	base_turf = /turf/space

/obj/abstract/docking_port_spawner/luciferase
	core_landmark_tag = "nav_luciferase"
	docking_tag = "luciferase_dock"

/area/luciferase
	abstract_type = /area/luciferase
	name = "Engineering Vessel"
	icon_state = "yellow"
	turf_initializer = /decl/turf_initializer/maintenance // to add dirt and webs and clutter and such

/area/luciferase/bridge
	abstract_type = /area/luciferase/bridge
	name = "Engineering Vessel Bridge"

/area/luciferase/bridge/port
	name = "Engineering Vessel Port Bridge"

/area/luciferase/bridge/starboard
	name = "Engineering Vessel Starboard Bridge"

/area/luciferase/atmos
	name = "Engineering Vessel Atmospherics"

/area/luciferase/engine
	name = "Engineering Vessel Engine Room"

/area/luciferase/maint
	name = "Engineering Vessel Maintenance"
	turf_initializer = /decl/turf_initializer/maintenance/heavy // has a chance to add live vermin!

/area/luciferase/electrical
	name = "Engineering Vessel Electrical"

/area/luciferase/cryo
	name = "Engineering Vessel Cryogenic Storage"

/area/luciferase/mess
	name = "Engineering Vessel Canteen"

/area/luciferase/engineering_equipmentroom
	name = "Engineering Vessel Equipment Room"

/area/luciferase/infirmary
	name = "Engineering Vessel Infirmary"

/area/luciferase/cargo
	name = "Engineering Vessel Cargo Bay"

/decl/submap_archetype/spawnable_ship/luciferase
	descriptor = "Luciferase-class prototype engineering vessel"
	crew_jobs = list(
		/datum/job/submap/shiptesting/luciferase_chief,
		/datum/job/submap/shiptesting/luciferase_engineer,
		/datum/job/submap/shiptesting/luciferase_deckhand,
		/datum/job/submap/shiptesting/luciferase_medic,
		/datum/job/submap/shiptesting/luciferase_pilot,
	)
	whitelisted_species = null
	blacklisted_species = null

/obj/abstract/submap_landmark/spawnpoint/luciferase_chief_spawn
	name = "Engineering Vessel Chief Engineer"

/obj/abstract/submap_landmark/spawnpoint/luciferase_engineer_spawn
	name = "Engineering Vessel Engineer"

/obj/abstract/submap_landmark/spawnpoint/luciferase_deckhand_spawn
	name = "Engineering Vessel Deckhand"

/obj/abstract/submap_landmark/spawnpoint/luciferase_medic_spawn
	name = "Engineering Vessel Medic"

/obj/abstract/submap_landmark/spawnpoint/luciferase_pilot_spawn
	name = "Engineering Vessel Pilot"

/obj/abstract/submap_landmark/joinable_submap/spawnable_ship/luciferase
	name = "Luciferase-class prototype engineering vessel"
	archetype = /decl/submap_archetype/spawnable_ship/luciferase

/datum/job/submap/shiptesting/luciferase_chief
	title = "Engineering Vessel Chief Engineer"
	info = "You are the chief engineer of a Luciferase-class prototype engineering vessel, captaining the ship and commanding its crew."
	total_positions = 1
	access = list(
		access_heads,
		access_medical,
		access_medical_equip,
		access_ce,
		access_change_ids,
		access_engine,
		access_engine_equip,
		access_atmospherics
	)
	outfit_type = /decl/hierarchy/outfit/job/generic/engineer/luciferase/chief
	skill_points = 25
	min_skill = list(
		SKILL_LITERACY     = SKILL_ADEPT,
		SKILL_PILOT        = SKILL_BASIC,
		SKILL_EVA          = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_ADEPT,
		SKILL_ELECTRICAL   = SKILL_ADEPT,
		SKILL_ATMOS        = SKILL_BASIC,
		SKILL_COMPUTER     = SKILL_BASIC,
		SKILL_ENGINES      = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT        = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL   = SKILL_MAX,
		SKILL_ATMOS        = SKILL_MAX,
		SKILL_ENGINES      = SKILL_MAX
	)
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null
	selection_color = "#1d1d4f"

/datum/job/submap/shiptesting/luciferase_engineer
	title = "Engineering Vessel Engineer"
	info = "You are an engineer on a Luciferase-class prototype engineering vessel, responsible for maintaining and repairing the ship's systems."
	total_positions = 3
	alt_titles = list(
		"Maintenance Technician",
		"Engine Technician",
		"Electrician",
		"Atmospheric Technician" = /decl/hierarchy/outfit/job/generic/engineer/luciferase/atmos,
	)
	access = list(
		access_engine,
		access_engine_equip,
		access_atmospherics
	)
	outfit_type = /decl/hierarchy/outfit/job/generic/engineer/luciferase
	min_skill = list(
		SKILL_LITERACY     = SKILL_BASIC,
		SKILL_EVA          = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL   = SKILL_BASIC,
		SKILL_ATMOS        = SKILL_BASIC,
		SKILL_COMPUTER     = SKILL_BASIC,
		SKILL_ENGINES      = SKILL_BASIC
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

/datum/job/submap/shiptesting/luciferase_deckhand
	title = "Engineering Vessel Deckhand"
	info = "You are a crew member on a Luciferase-class prototype engineering vessel, handing miscellaneous duties as-needed."
	total_positions = 3
	access = list(
		access_engine
	)
	outfit_type = /decl/hierarchy/outfit/job/generic/luciferase_deckhand
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

/datum/job/submap/shiptesting/luciferase_medic
	title = "Engineering Vessel Medic"
	info = "You are the medic of a Luciferase-class prototype engineering vessel, providing medical care to the crew."
	total_positions = 1
	access = list(
		access_engine,
		access_medical,
		access_medical_equip
	)
	outfit_type = /decl/hierarchy/outfit/job/generic/doctor/luciferase
	skill_points = 32
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

/datum/job/submap/shiptesting/luciferase_pilot
	title = "Engineering Vessel Pilot"
	info = "You are the pilot of a Luciferase-class prototype engineering vessel, responsible for navigating the ship."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/generic/luciferase_pilot
	skill_points = 25
	min_skill = list(
		SKILL_LITERACY = SKILL_BASIC,
		SKILL_PILOT    = SKILL_ADEPT,
		SKILL_EVA      = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX
	)
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null

/decl/hierarchy/outfit/job/generic/luciferase_pilot
	name = "Job - Engineering vessel pilot"
	uniform = /obj/item/clothing/jumpsuit/pilot

/decl/hierarchy/outfit/job/generic/engineer/luciferase
	name = "Job - Engineering vessel engineer"
	uniform = /obj/item/clothing/jumpsuit/engineer
	belt = /obj/item/belt/utility/full

/decl/hierarchy/outfit/job/generic/engineer/luciferase/atmos
	name = "Job - Engineering vessel atmospheric technician"
	uniform = /obj/item/clothing/jumpsuit/atmospheric_technician
	belt = /obj/item/belt/utility/atmostech
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/generic/engineer/luciferase/chief
	name = "Job - Engineering vessel chief engineer"
	uniform = /obj/item/clothing/jumpsuit/chief_engineer
	pda_type = /obj/item/modular_computer/pda/heads/ce
	id_type = /obj/item/card/id/civilian/head

/decl/hierarchy/outfit/job/generic/doctor/luciferase
	name = "Job - Engineering vessel medic"

/decl/hierarchy/outfit/job/generic/luciferase_deckhand
	name = "Job - Engineering vessel deckhand"

// Comms
/obj/machinery/network/telecomms_hub/luciferase
	req_access = list(access_ce)
	initial_network_id = "lucynet"
	// I wanted to make them just have the engineering channel, but that stops them from talking to other vessels that don't have it.
	channels = list(
		COMMON_FREQUENCY_DATA,
		list(
			"name" = "Engineering",
			"key" = "e",
			"frequency" = 1357,
			"color" = COMMS_COLOR_ENGINEER,
			"span_class" = "engradio",
			"secured" = access_engine
		),
	)