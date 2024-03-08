/datum/level_data/player_level/shaded_hills
	use_global_exterior_ambience = FALSE
	base_area = null
	abstract_type = /datum/level_data/player_level/shaded_hills

/datum/level_data/player_level/shaded_hills/embark
	name = "Embark"
	ambient_light_level = 1
	ambient_light_color = "#f3e6ca"
	strata = /decl/strata/igneous
	exterior_atmosphere = list(
		/decl/material/gas/oxygen =   MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
	level_generators = list(
		/datum/random_map/noise/ore/poor,
		/datum/random_map/noise/forage
	)

/datum/level_data/player_level/shaded_hills/embark/after_generate_level()
	. = ..()
	SSweather.setup_weather_system(src)

/obj/abstract/level_data_spawner/shaded_hills
	level_data_type = /datum/level_data/player_level/shaded_hills/embark
