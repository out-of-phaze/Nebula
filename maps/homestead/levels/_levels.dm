/obj/abstract/map_data/homestead
	height = 2

/datum/level_data/main_level/homestead
	use_global_exterior_ambience = FALSE
	base_area = null
	base_turf = /turf/floor/dirt
	abstract_type = /datum/level_data/main_level/homestead
	ambient_light_level = 1
	ambient_light_color = "#f3e6ca"
	strata = /decl/strata/homestead
	exterior_atmosphere = list(
		/decl/material/gas/oxygen =   MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
	daycycle_type = /datum/daycycle/homestead
	daycycle_id = "daycycle_homestead"
	template_edge_padding = 0 // we use a strictly delineated subarea, no need for this guard
	persistent_data_location = "data/level_data"

// don't opt out of it on a serde-based basis
/datum/level_data/main_level/homestead/should_generate_level()
	if(!get_config_value(/decl/config/toggle/roundstart_level_generation) || !(get_subtemplate_budget() || length(level_generators)))
		return FALSE
	return TRUE

/datum/level_data/main_level/homestead/generate_level()
	// if we persist the subtemplate area, we need to avoid making new subtemplates
	// todo: handle list subtemplate_area, which is technically allowed
	if(has_serde_data())
		var/area/subtemplate_area_type = subtemplate_area || base_area
		if(isarea(subtemplate_area_type) && (subtemplate_area_type::area_flags & AREA_FLAG_ALLOW_LEVEL_PERSISTENCE))
			subtemplate_budget = 0
	return ..()

/datum/daycycle/homestead
	cycle_duration = 2 HOURS // 1 hour of daylight, 1 hour of night

// Randomized time of day to start at.
/datum/daycycle/homestead/New()
	time_in_cycle = rand(cycle_duration)
	..()

/datum/level_data/main_level/homestead/grassland
	name = "Homestead - Grassland"
	level_id = "homestead_grassland"
	level_generators = list(
		/datum/random_map/automata/cave_system/homestead,
		/datum/random_map/noise/ore/poor/homestead,
		/datum/random_map/noise/forage/homestead/grassland
	)
	connected_levels = list(
		"homestead_woods"     = NORTH,
		"homestead_swamp"     = SOUTH,
		"homestead_downlands" = EAST
	)
	subtemplate_budget = 5
	subtemplate_category = MAP_TEMPLATE_CATEGORY_FANTASY_GRASSLAND
	subtemplate_area = /area/homestead/outside/poi
	persistent_data_location = "data/level_data"

/datum/level_data/main_level/homestead/grassland/generate_level()
	// if we have persistent data, remove the ones we don't want to re-generate (like the forage map)
	// todo: make this not hardcoded
	if(has_serde_data())
		// no need to remove caves because that checks mask turfs
		// no need to remove ore because we don't serialize extensions (oops, oversight, but it might be too expensive to anyway)
		level_generators -= /datum/random_map/noise/forage/homestead/grassland
	return ..()

// todo: some kind of mob migration events to repopulate the level over time
/datum/level_data/main_level/homestead/grassland/get_mobs_to_populate_level()
	if(has_serde_data()) // we've already generated mobs
		return
	var/static/list/mobs_to_spawn = list(
		list(
			list(
				/mob/living/simple_animal/passive/mouse        = 9,
				/mob/living/simple_animal/passive/rabbit       = 3,
				/mob/living/simple_animal/passive/rabbit/brown = 3,
				/mob/living/simple_animal/passive/rabbit/black = 3,
				/mob/living/simple_animal/opossum              = 5
			),
			/turf/floor/grass,
			10
		)
	)
	return mobs_to_spawn

/datum/level_data/main_level/homestead/swamp
	name = "Homestead - Swamp"
	level_id = "homestead_swamp"
	connected_levels = list(
		"homestead_grassland" = NORTH
	)
	level_generators = list(
		/datum/random_map/automata/cave_system/homestead,
		/datum/random_map/noise/homestead/swamp,
		/datum/random_map/noise/forage/homestead/swamp
	)
	subtemplate_budget = 5
	subtemplate_category = MAP_TEMPLATE_CATEGORY_FANTASY_SWAMP
	subtemplate_area = /area/homestead/outside/swamp/poi
	persistent_data_location = "data/level_data"

/datum/level_data/main_level/homestead/swamp/generate_level()
	// if we have persistent data, remove the ones we don't want to re-generate (like the forage map)
	// todo: make this not hardcoded
	if(has_serde_data())
		// no need to remove the noisemap because it checks for mask turfs
		level_generators -= /datum/random_map/noise/forage/homestead/swamp
	return ..()

/datum/level_data/main_level/homestead/swamp/get_mobs_to_populate_level()
	if(has_serde_data()) // we've already generated mobs
		return
	var/static/list/mobs_to_spawn = list(
		list(
			list(
				/mob/living/simple_animal/passive/mouse        = 6,
				/mob/living/simple_animal/passive/rabbit       = 2,
				/mob/living/simple_animal/passive/rabbit/brown = 2,
				/mob/living/simple_animal/passive/rabbit/black = 2,
				/mob/living/simple_animal/frog                 = 3,
				/mob/living/simple_animal/frog/brown           = 2,
				/mob/living/simple_animal/frog/yellow          = 2,
				/mob/living/simple_animal/frog/purple          = 1
			),
			/turf/floor/grass,
			5
		),
		list(
			list(
				/mob/living/simple_animal/frog                 = 3,
				/mob/living/simple_animal/frog/brown           = 2,
				/mob/living/simple_animal/frog/yellow          = 2,
				/mob/living/simple_animal/frog/purple          = 1
			),
			/turf/floor/mud,
			10
		)
	)
	return mobs_to_spawn

/datum/level_data/main_level/homestead/woods
	name = "Homestead - Woods"
	level_id = "homestead_woods"
	connected_levels = list(
		"homestead_grassland" = SOUTH
	)
	level_generators = list(
		/datum/random_map/automata/cave_system/homestead,
		/datum/random_map/noise/homestead/woods,
		/datum/random_map/noise/forage/homestead/woods
	)
	subtemplate_budget = 5
	subtemplate_category = MAP_TEMPLATE_CATEGORY_FANTASY_WOODS
	subtemplate_area = /area/homestead/outside/woods/poi
	persistent_data_location = "data/level_data"

/datum/level_data/main_level/homestead/woods/generate_level()
	// if we have persistent data, remove the ones we don't want to re-generate (like the forage map)
	// todo: make this not hardcoded
	if(has_serde_data())
		// no need to remove the noisemap because it checks for mask turfs
		level_generators -= /datum/random_map/noise/forage/homestead/woods
	return ..()

/datum/level_data/main_level/homestead/woods/get_mobs_to_populate_level()
	if(has_serde_data()) // we've already generated mobs
		return
	var/static/list/mobs_to_spawn = list(
		list(
			list(
				/mob/living/simple_animal/passive/mouse        = 6,
				/mob/living/simple_animal/passive/rabbit       = 2,
				/mob/living/simple_animal/passive/rabbit/brown = 2,
				/mob/living/simple_animal/passive/rabbit/black = 2,
				/mob/living/simple_animal/opossum              = 2
			),
			/turf/floor/grass,
			10
		),
		list(
			list(
				/mob/living/simple_animal/passive/deer         = 1
			),
			/turf/floor/grass,
			5
		)
	)
	return mobs_to_spawn

/datum/level_data/main_level/homestead/caverns
	name = "Homestead - Caverns"
	level_id = "homestead_caverns"
	connected_levels = list(
		"homestead_dungeon" = EAST
	)
	subtemplate_budget = 5
	subtemplate_category = MAP_TEMPLATE_CATEGORY_FANTASY_CAVERNS
	subtemplate_area = /area/homestead/caves/deep/poi
	level_generators = list(
		/datum/random_map/automata/cave_system/homestead,
		/datum/random_map/noise/ore/rich/homestead
	)
	base_turf = /turf/floor/rock/basalt
	daycycle_id = null // you get your light from above

/obj/abstract/level_data_spawner/homestead_grassland
	level_data_type = /datum/level_data/main_level/homestead/grassland

/obj/abstract/level_data_spawner/homestead_swamp
	level_data_type = /datum/level_data/main_level/homestead/swamp

/obj/abstract/level_data_spawner/homestead_woods
	level_data_type = /datum/level_data/main_level/homestead/woods

/obj/abstract/level_data_spawner/homestead_caverns
	level_data_type = /datum/level_data/main_level/homestead/caverns
