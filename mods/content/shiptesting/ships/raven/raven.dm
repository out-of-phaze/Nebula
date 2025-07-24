/datum/map_template/ship/raven
	name = "Raven-class salvage vessel"
	suffixes = list("raven/raven.dmm")
	area_usage_test_exempted_root_areas = list(/area/raven)
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/raven)


/obj/effect/overmap/visitable/ship/landable/spawnable/raven
	name = "Salvage Vessel"
	desc = "Sensors detect a Raven-class salvage vessel."
	shuttle = "Salvage Vessel"
	fore_dir = EAST
	max_speed = 1/(3 SECONDS)
	sector_flags = OVERMAP_SECTOR_IN_SPACE
	use_mapped_z_levels = TRUE
	ship_name_classes = list("GENERAL", "SPACE", "NATURAL")


/datum/shuttle/autodock/overmap/raven
	name = "Salvage Vessel"
	warmup_time = 4 // in seconds
	fuel_consumption = 0
	current_location = "nav_raven"
	dock_target = "raven_dock"
	defer_initialisation = TRUE
	shuttle_area = list(
		/area/raven/bridge,
		/area/raven/dining,
		/area/raven/eva/port,
		/area/raven/eva/starboard,
		/area/raven/medical,
		/area/raven/crew_quarters,
		/area/raven/cargo_bay,
		/area/raven/electrical,
		/area/raven/damage_control,
		/area/raven/atmospherics
	)
	flags = SHUTTLE_FLAGS_PROCESS


/obj/effect/shuttle_landmark/ship/raven
	shuttle_name = "Salvage Vessel"
	landmark_tag = "nav_raven"
	flags = SLANDMARK_FLAG_ZERO_G | SLANDMARK_FLAG_REORIENT
	base_area = /area/space
	base_turf = /turf/space


/obj/abstract/docking_port_spawner/raven
	abstract_type = /obj/abstract/docking_port_spawner/raven
	docking_tag = "raven_dock"

/obj/abstract/docking_port_spawner/raven/port
	core_landmark_tag = "nav_raven_port"

/obj/abstract/docking_port_spawner/raven/starboard
	core_landmark_tag = "nav_raven_starboard"



/area/raven
	name = "Salvage Vessel"
	icon_state = "yellow"

/area/raven/bridge
	name = "Salvage Vessel Bridge"

/area/raven/dining
	name = "Salvage Vessel Canteen"

/area/raven/eva
	abstract_type = /area/raven/eva

/area/raven/eva/port
	name = "Salvage Vessel Port EVA"

/area/raven/eva/starboard
	name = "Salvage Vessel Starboard EVA"

/area/raven/crew_quarters
	name = "Salvage Vessel Crew Quarters"

/area/raven/medical
	name = "Salvage Vessel Infirmary"

/area/raven/cargo_bay
	name = "Salvage Vessel Cargo Bay"

/area/raven/aft_hatch
	name = "Salvage Vessel Aft Hatch"

/area/raven/damage_control
	name = "Salvage Vessel Damage Control"

/area/raven/electrical
	name = "Salvage Vessel Electrical Room"

/area/raven/atmospherics
	name = "Salvage Vessel Atmospherics"



/decl/submap_archetype/spawnable_ship/raven
	name = "Raven-class salvage vessel"
	crew_jobs = list(
		/datum/job/submap/shiptesting/raven/pilot,
		/datum/job/submap/shiptesting/raven/medic,
		/datum/job/submap/shiptesting/raven/salvager,
		/datum/job/submap/shiptesting/raven/deck_hand,
	)
	whitelisted_species = null
	blacklisted_species = null

/obj/abstract/submap_landmark/spawnpoint/raven
	abstract_type = /obj/abstract/submap_landmark/spawnpoint/raven

/obj/abstract/submap_landmark/spawnpoint/raven/pilot
//	name = "Salvage Vessel Pilot"
	name = /datum/job/submap/shiptesting/raven/pilot::title

/obj/abstract/submap_landmark/spawnpoint/raven/salvager
//	name = "Salvage Vessel Salvager"
	name = /datum/job/submap/shiptesting/raven/salvager::title

/obj/abstract/submap_landmark/spawnpoint/raven/medic
//	name = "Salvage Vessel Medic"
	name = /datum/job/submap/shiptesting/raven/medic::title

/obj/abstract/submap_landmark/spawnpoint/raven/deck_hand
//	name = "Salvage Vessel Deck Hand"
	name = /datum/job/submap/shiptesting/raven/deck_hand::title


/obj/abstract/submap_landmark/joinable_submap/spawnable_ship/raven
	name = "Raven-class salvage vessel"
	archetype = /decl/submap_archetype/spawnable_ship/raven


/datum/job/submap/shiptesting/raven
	abstract_type = /datum/job/submap/shiptesting/raven
	skill_points = 25
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null
	selection_color = "#7f6e2c"

// Pilot.
/datum/job/submap/shiptesting/raven/pilot
	title = "Salvage Vessel Pilot"
	info = "You are the pilot of a Raven-class salvage vessel, profiting off the misfortune of others who came before you."
	outfit_type = /decl/outfit/job/generic/raven_pilot
	total_positions = 1
	min_skill = list(
		SKILL_LITERACY = SKILL_BASIC,
		SKILL_PILOT    = SKILL_ADEPT,
		SKILL_EVA      = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX
	)

/decl/outfit/job/generic/raven_pilot
	name = "Job - Salvage vessel pilot"
	uniform = /obj/item/clothing/jumpsuit/pilot
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR

// Salvager.
/datum/job/submap/shiptesting/raven/salvager
	title = "Salvage Vessel Salvager"
	info = "You are a salvager of a Raven-class salvage vessel, profiting off the misfortune of others who came before you."
	outfit_type = /decl/outfit/job/generic/engineer/johnson_technician
	total_positions = 2
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

/datum/job/submap/shiptesting/raven/medic
	title = "Salvage Vessel Medic"
	info = "You are the medic of a Raven-class salvage vessel, profiting off the misfortune of others who came before you."
	selection_color = "#026865"
	outfit_type = /decl/outfit/job/generic/doctor/johnson_medic
	total_positions = 1
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

/datum/job/submap/shiptesting/raven/deck_hand
	title = "Salvage Vessel Deck Hand"
	info = "You are a crew member of a Raven-class salvage vessel, profiting off the misfortune of others who came before you."
	total_positions = 3
	outfit_type = /decl/outfit/job/generic/johnson_mining
	min_skill = list(
		SKILL_LITERACY = SKILL_BASIC,
		SKILL_HAULING  = SKILL_ADEPT,
		SKILL_EVA      = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX
	)


/*

/datum/job/submap/shiptesting/johnson_pilot
	title = "Mining Vessel Pilot"
	info = "You are the pilot of a Johnson-class deep space mining vessel, harvesting ore in the outer regions of explored space."
	total_positions = 1
	outfit_type = /decl/outfit/job/generic/johnson_pilot
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
	outfit_type = /decl/outfit/job/generic/engineer/johnson_technician
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
	outfit_type = /decl/outfit/job/generic/johnson_mining
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
	outfit_type = /decl/outfit/job/generic/doctor/johnson_medic
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

/decl/outfit/job/generic/johnson_pilot
	name = "Job - Mining vessel pilot"
	uniform = /obj/item/clothing/jumpsuit/pilot
	id_type = /obj/item/card/id/civilian/head
	pda_type = /obj/item/modular_computer/pda/heads/captain
	l_ear = null
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR

/decl/outfit/job/generic/engineer/johnson_technician
	name = "Job - Mining vessel technician"
	uniform = /obj/item/clothing/jumpsuit/engineer
	belt = /obj/item/belt/utility/full
	l_ear = null
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR

/decl/outfit/job/generic/johnson_mining
	name = "Job - Mining vessel shaft miner"
	uniform = /obj/item/clothing/jumpsuit/miner
	pda_type = /obj/item/modular_computer/pda/science
	backpack_contents = list(/obj/item/crowbar = 1, /obj/item/ore = 1)
	outfit_flags = (parent_type::outfit_flags | OUTFIT_EXTENDED_SURVIVAL) & ~OUTFIT_HAS_VITALS_SENSOR
	l_ear = null

/decl/outfit/job/generic/johnson_mining/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/outfit/job/generic/doctor/johnson_medic
	name = "Job - Mining vessel medic"
	l_ear = null
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR

*/