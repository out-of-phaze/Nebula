/datum/level_data/crux
	use_global_exterior_ambience = FALSE
	ambient_light_level = 1
	ambient_light_color = "#f3e6ca"
	base_turf = /turf/exterior/dirt
	exterior_atmosphere = list(
		/decl/material/gas/oxygen =   MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
	strata = /decl/strata/sedimentary
	// Firedoors can be mapped over maintenance shafts.
	UT_turf_exceptions_by_door_type = list(
		/obj/machinery/door/firedoor = list(
			/turf/simulated/open,
			/turf/exterior/open
		)
	)
	abstract_type = /datum/level_data/crux

// z1, rocks and ocean shallows under Port Eleostura
/datum/level_data/crux/below
	name = "Port Eleostura - Below Ground Level"
	ambient_light_level = 0.4
	ambient_light_color = "#59f7dc"
	connected_levels = list("eleostura_shallows" = WEST)
	base_area = /area/crux/outside/underground
	transition_turf_type = /turf/unsimulated/mimic_edge/transition/flooded
	level_id = "eleostura_belowground"
	level_generators = list(
		/datum/random_map/noise/crux/seafloor,
		/datum/random_map/automata/cave_system/crux,
		/datum/random_map/noise/ore/poor
	)
/obj/abstract/level_data_spawner/crux_below
	name = "Port Eleostura - Below Ground Level"
	level_data_type = /datum/level_data/crux/below

// z2, main station entrance etc.
/datum/level_data/crux/ground_floor
	name = "Port Eleostura - Ground Floor"
	level_id = "eleostura_ground"
	connected_levels = list(
		"eleostura_wilderness" = EAST,
		"eleostura_over_sea"   = WEST
	)
	base_area = /area/crux/outside
	level_generators = list(
		/datum/random_map/noise/crux/grassland
	)
/obj/abstract/level_data_spawner/crux_ground_floor
	name = "Port Eleostura - Ground Floor"
	level_data_type = /datum/level_data/crux/ground_floor

// z2, station ops
/datum/level_data/crux/level_one
	name = "Port Eleostura - Level One"
	level_id = "eleostura_level_1"
	base_area = /area/crux/outside/level_one
/obj/abstract/level_data_spawner/crux_level_one
	name = "Port Eleostura - Level One"
	level_data_type = /datum/level_data/crux/level_one

// z3, station command
/datum/level_data/crux/level_two
	name = "Port Eleostura - Level Two"
	level_id = "eleostura_level_2"
	base_area = /area/crux/outside/level_two
/obj/abstract/level_data_spawner/crux_level_two
	name = "Port Eleostura - Level Two"
	level_data_type = /datum/level_data/crux/level_two

// ocean z1, deep ocean, west of Eleostura
/datum/level_data/crux/ocean_abyss
	name = "Port Eleostura - Abyssal Ocean"
	level_id = "eleostura_abyss"
	exterior_atmosphere = null
	ambient_light_level = 0.2
	ambient_light_color = "#003cff"
	base_area = /area/crux/outside/ocean/abyssal
	level_generators = list(
		/datum/random_map/noise/crux/abyss,
		/datum/random_map/automata/cave_system/crux/flooded,
		/datum/random_map/noise/ore/rich
	)
/obj/abstract/level_data_spawner/crux_ocean_abyss
	name = "Port Eleostura - Abyssal Ocean"
	level_data_type = /datum/level_data/crux/ocean_abyss

// ocean z2, shallow ocean, west of Eleostura
/datum/level_data/crux/ocean_shallows
	name = "Port Eleostura - Ocean Shallows"
	level_id = "eleostura_shallows"
	connected_levels = list("eleostura_belowground" = EAST)
	transition_turf_type = /turf/unsimulated/mimic_edge/transition/flooded
	ambient_light_level = 0.4
	ambient_light_color = "#59f7dc"
	base_area = /area/crux/outside/ocean/deep
	level_generators = list(
		/datum/random_map/noise/crux/seafloor
	)
/obj/abstract/level_data_spawner/crux_ocean_shallows
	name = "Port Eleostura - Ocean Shallows"
	level_data_type = /datum/level_data/crux/ocean_shallows

// ocean z3, over the ocean, west of Eleostura
/datum/level_data/crux/ocean
	name = "Port Eleostura - Out At Sea"
	level_id = "eleostura_over_sea"
	base_area = /area/crux/outside/ocean_over
	connected_levels = list("eleostura_ground" = EAST)
/obj/abstract/level_data_spawner/crux_ocean
	name = "Port Eleostura - Out At Sea"
	level_data_type = /datum/level_data/crux/ocean

// wilderness z1, east of Eleostura
/datum/level_data/crux/wilderness
	name = "Port Eleostura - Wilderness"
	level_id = "eleostura_wilderness"
	connected_levels = list("eleostura_ground" = WEST)
	level_generators = list(
		/datum/random_map/noise/crux/grassland/forest
	)
	base_area = /area/crux/outside/wilderness
/obj/abstract/level_data_spawner/crux_wilderness
	name = "Port Eleostura - Wilderness"
	level_data_type = /datum/level_data/crux/wilderness
