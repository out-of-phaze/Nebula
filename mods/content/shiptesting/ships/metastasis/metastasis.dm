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
		/datum/job/submap/shiptesting/metastasis/captain,
		/datum/job/submap/shiptesting/metastasis/pilot,
		/datum/job/submap/shiptesting/metastasis/medic,
		/datum/job/submap/shiptesting/metastasis/salvor,
		/datum/job/submap/shiptesting/metastasis/deckhand,
	)
	whitelisted_species = null
	blacklisted_species = null

/obj/abstract/submap_landmark/spawnpoint/metastasis
	abstract_type = /obj/abstract/submap_landmark/spawnpoint/metastasis

/obj/abstract/submap_landmark/spawnpoint/metastasis/captain
	name = /datum/job/submap/shiptesting/metastasis/captain::title

/obj/abstract/submap_landmark/spawnpoint/metastasis/pilot
	name = /datum/job/submap/shiptesting/metastasis/pilot::title

/obj/abstract/submap_landmark/spawnpoint/metastasis/salvor
	name = /datum/job/submap/shiptesting/metastasis/salvor::title

/obj/abstract/submap_landmark/spawnpoint/metastasis/medic
	name = /datum/job/submap/shiptesting/metastasis/medic::title

/obj/abstract/submap_landmark/spawnpoint/metastasis/deckhand
	name = /datum/job/submap/shiptesting/metastasis/deckhand::title


/obj/abstract/submap_landmark/joinable_submap/spawnable_ship/metastasis
	name = "Metastasis-class salvage vessel"
	archetype = /decl/submap_archetype/spawnable_ship/metastasis


/datum/job/submap/shiptesting/metastasis
	abstract_type = /datum/job/submap/shiptesting/metastasis
	supervisors = "the Captain"
	skill_points = 25
	no_skill_buffs = TRUE // stopgap for utility frames
	whitelisted_species = null
	blacklisted_species = null
	selection_color = "#7f6e2c"

// Captain.
/datum/job/submap/shiptesting/metastasis/captain
	title = "Salvage Vessel Captain"
	info = "You are the captain of a Metastasis-class salvage vessel, captaining the ship and commanding its crew."
	description = "You are the captain of a Metastasis-class salvage vessel, captaining the ship and commanding its crew."
	supervisors = "your conscience and your bottom line"
	outfit_type = /decl/outfit/job/generic/metastasis_captain
	total_positions = 1
	selection_color = "#1d1d4f"
	min_skill = list(
		SKILL_LITERACY     = SKILL_ADEPT,
		SKILL_PILOT        = SKILL_BASIC,
		SKILL_EVA          = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL   = SKILL_BASIC,
		SKILL_ATMOS        = SKILL_BASIC,
		SKILL_COMPUTER     = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX
	)

/decl/outfit/job/generic/metastasis_captain
	name = "Job - Salvage vessel captain"
	uniform = /obj/item/clothing/jumpsuit/blue
	pda_type = /obj/item/modular_computer/pda/heads
	id_type = /obj/item/card/id/civilian/head
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR

// Pilot.
/datum/job/submap/shiptesting/metastasis/pilot
	title = "Salvage Vessel Pilot"
	info = "You are the pilot of a Metastasis-class salvage vessel, flying the vessel and ensuring it doesn't join the wrecks."
	description = "You are the pilot of a Metastasis-class salvage vessel, flying the vessel and ensuring it doesn't join the wrecks."
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
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/black
	glasses = /obj/item/clothing/glasses/sunglasses
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR

// Salvor.
/datum/job/submap/shiptesting/metastasis/salvor
	title = "Salvage Vessel Salvor"
	info = "You are a salvor of a Metastasis-class salvage vessel, exploring wrecks and ruins to profit off the misfortune of others who came before you."
	description = "You are a salvor of a Metastasis-class salvage vessel, exploring wrecks and ruins to profit off the misfortune of others who came before you."
	outfit_type = /decl/outfit/job/generic/engineer/metastasis_salvor
	total_positions = 2
	min_skill = list(
		SKILL_LITERACY     = SKILL_BASIC,
		SKILL_EVA          = SKILL_ADEPT,
		SKILL_HAULING      = SKILL_BASIC,
		SKILL_CONSTRUCTION = SKILL_BASIC,
		SKILL_ELECTRICAL   = SKILL_BASIC,
		SKILL_ATMOS        = SKILL_BASIC,
		SKILL_COMPUTER     = SKILL_BASIC
	)
	max_skill = list(
		SKILL_CONSTRUCTION = SKILL_EXPERT,
		SKILL_ELECTRICAL   = SKILL_EXPERT,
		SKILL_ATMOS        = SKILL_EXPERT
	)

/decl/outfit/job/generic/engineer/metastasis_salvor
	name = "Job - Salvage vessel salvor"
	uniform = /obj/item/clothing/jumpsuit/work/heph
	head = null
	gloves = /obj/item/clothing/gloves/thick/duty
	pda_type = /obj/item/modular_computer/pda/cargo
	l_ear = /obj/item/radio/headset
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR

// Medic.
/datum/job/submap/shiptesting/metastasis/medic
	title = "Salvage Vessel Medic"
	info = "You are the medic of a Metastasis-class salvage vessel, providing care for your crew so that they do not become future loot for other salvors."
	description = "You are the medic of a Metastasis-class salvage vessel, providing care for your crew so that they do not become future loot for other salvors."
	selection_color = "#026865"
	outfit_type = /decl/outfit/job/generic/doctor/metastasis_medic
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

/decl/outfit/job/generic/doctor/metastasis_medic
	name = "Job - Salvage vessel medic"
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR

/datum/job/submap/shiptesting/metastasis/deckhand
	title = "Salvage Vessel Deckhand"
	info = "You are a crew member of a Metastasis-class salvage vessel, assigned to assist the rest of the crew with running the ship."
	description = "You are a crew member of a Metastasis-class salvage vessel, assigned to assist the rest of the crew with running the ship."
	total_positions = 3
	outfit_type = /decl/outfit/job/generic/metastasis_deckhand
	min_skill = list(
		SKILL_LITERACY = SKILL_BASIC,
		SKILL_HAULING  = SKILL_ADEPT,
		SKILL_EVA      = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX
	)

/decl/outfit/job/generic/metastasis_deckhand
	name = "Job - Salvage vessel deckhand"
	uniform = /obj/item/clothing/jumpsuit/work
	suit = null
	outfit_flags = parent_type::outfit_flags & ~OUTFIT_HAS_VITALS_SENSOR