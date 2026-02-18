/datum/map/homestead
	default_liquid_fuel_type = /decl/material/liquid/oil
	default_species = /decl/species/human::uid
	loadout_categories = list(
		/decl/loadout_category/fantasy/clothing,
		/decl/loadout_category/fantasy/utility
	)

/datum/map/homestead/finalize_map_generation()
	. = ..()
	var/static/list/banned_weather = list(
/* 		/decl/state/weather/snow/medium,
		/decl/state/weather/snow/heavy,
		/decl/state/weather/snow */
	)
	var/datum/level_data/shadyhills = SSmapping.levels_by_id["homestead_grassland"]
	if(istype(shadyhills)) // if this is false, something has badly exploded
		SSweather.setup_weather_system(shadyhills, banned_states = banned_weather)

/decl/spawnpoint/arrivals
	name = "Migration"
	spawn_announcement = null
