/datum/map_template/ship/metastasis
	name = "Metastasis-class salvage vessel"
	suffixes = list("metastasis/metastasis.dmm")
	area_usage_test_exempted_root_areas = list(/area/metastasis)
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/metastasis)


/obj/effect/overmap/visitable/ship/landable/spawnable/metastasis
	name = "Salvage Vessel"
	desc = "Sensors detect a Metastasis-class salvage vessel."
	shuttle = "Salvage Vessel"
	fore_dir = EAST
	max_speed = 1/(3 SECONDS)
	sector_flags = OVERMAP_SECTOR_IN_SPACE
	use_mapped_z_levels = TRUE
	ship_name_classes = list("GENERAL", "SPACE", "NATURAL")


/datum/shuttle/autodock/overmap/metastasis
	name = "Salvage Vessel"
	warmup_time = 4 // in seconds
	fuel_consumption = 0
	current_location = "nav_metastasis"
	dock_target = "metastasis_dock"
	defer_initialisation = TRUE
	shuttle_area = list(
		/area/metastasis/bridge,
		/area/metastasis/dining,
		/area/metastasis/eva/port,
		/area/metastasis/eva/starboard,
		/area/metastasis/medical,
		/area/metastasis/crew_quarters,
		/area/metastasis/cargo_bay,
		/area/metastasis/electrical,
		/area/metastasis/damage_control,
		/area/metastasis/atmospherics
	)
	flags = SHUTTLE_FLAGS_PROCESS


/obj/effect/shuttle_landmark/ship/metastasis
	shuttle_name = "Salvage Vessel"
	landmark_tag = "nav_metastasis"
	flags = SLANDMARK_FLAG_ZERO_G | SLANDMARK_FLAG_REORIENT
	base_area = /area/space
	base_turf = /turf/space


/obj/abstract/docking_port_spawner/metastasis
	abstract_type = /obj/abstract/docking_port_spawner/metastasis
	docking_tag = "metastasis_dock"

/obj/abstract/docking_port_spawner/metastasis/port
	core_landmark_tag = "nav_metastasis_port"

/obj/abstract/docking_port_spawner/metastasis/starboard
	core_landmark_tag = "nav_metastasis_starboard"



/area/metastasis
	name = "Salvage Vessel"
	icon_state = "yellow"

/area/metastasis/bridge
	name = "Salvage Vessel Bridge"

/area/metastasis/dining
	name = "Salvage Vessel Canteen"

/area/metastasis/eva
	abstract_type = /area/metastasis/eva

/area/metastasis/eva/port
	name = "Salvage Vessel Port EVA"

/area/metastasis/eva/starboard
	name = "Salvage Vessel Starboard EVA"

/area/metastasis/crew_quarters
	name = "Salvage Vessel Crew Quarters"

/area/metastasis/medical
	name = "Salvage Vessel Infirmary"

/area/metastasis/cargo_bay
	name = "Salvage Vessel Cargo Bay"

/area/metastasis/damage_control
	name = "Salvage Vessel Damage Control"

/area/metastasis/electrical
	name = "Salvage Vessel Electrical Room"

/area/metastasis/atmospherics
	name = "Salvage Vessel Atmospherics"



/decl/submap_archetype/spawnable_ship/metastasis
	name = "Metastasis-class salvage vessel"
	crew_jobs = list(
		/datum/job/submap/shiptesting/metastasis/pilot,
		/datum/job/submap/shiptesting/metastasis/medic,
		/datum/job/submap/shiptesting/metastasis/salvager,
		/datum/job/submap/shiptesting/metastasis/deck_hand,
	)
	whitelisted_species = null
	blacklisted_species = null

/obj/abstract/submap_landmark/spawnpoint/metastasis
	abstract_type = /obj/abstract/submap_landmark/spawnpoint/metastasis

/obj/abstract/submap_landmark/spawnpoint/metastasis/pilot
	name = /datum/job/submap/shiptesting/metastasis/pilot::title

/obj/abstract/submap_landmark/spawnpoint/metastasis/salvager
	name = /datum/job/submap/shiptesting/metastasis/salvager::title

/obj/abstract/submap_landmark/spawnpoint/metastasis/medic
	name = /datum/job/submap/shiptesting/metastasis/medic::title

/obj/abstract/submap_landmark/spawnpoint/metastasis/deck_hand
	name = /datum/job/submap/shiptesting/metastasis/deck_hand::title


/obj/abstract/submap_landmark/joinable_submap/spawnable_ship/metastasis
	name = "Metastasis-class salvage vessel"
	archetype = /decl/submap_archetype/spawnable_ship/metastasis


/datum/job/submap/shiptesting/metastasis
	abstract_type = /datum/job/submap/shiptesting/metastasis
	skill_points = 25
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null
	selection_color = "#7f6e2c"

// Pilot.
/datum/job/submap/shiptesting/metastasis/pilot
	title = "Salvage Vessel Pilot"
	info = "You are the pilot of a Metastasis-class salvage vessel, profiting off the misfortune of others who came before you."
	outfit_type = /decl/outfit/job/generic/metastasis_pilot
	total_positions = 1
	min_skill = list(
		SKILL_LITERACY = SKILL_BASIC,
		SKILL_PILOT    = SKILL_ADEPT,
		SKILL_EVA      = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX
	)

/decl/outfit/job/generic/metastasis_pilot
	name = "Job - Salvage vessel pilot"
	uniform = /obj/item/clothing/jumpsuit/pilot
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR

// Salvager.
/datum/job/submap/shiptesting/metastasis/salvager
	title = "Salvage Vessel Salvager"
	info = "You are a salvager of a Metastasis-class salvage vessel, profiting off the misfortune of others who came before you."
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

/datum/job/submap/shiptesting/metastasis/medic
	title = "Salvage Vessel Medic"
	info = "You are the medic of a Metastasis-class salvage vessel, profiting off the misfortune of others who came before you."
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

/datum/job/submap/shiptesting/metastasis/deck_hand
	title = "Salvage Vessel Deck Hand"
	info = "You are a crew member of a Metastasis-class salvage vessel, profiting off the misfortune of others who came before you."
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