/datum/planetoid_data/outpost
	id                  = "alpha"
	name                = "\proper Alpha"
	topmost_level_id    = "alpha_sky"
	surface_level_id    = "alpha_surface"
	habitability_class  = HABITABILITY_IDEAL
	atmosphere          = new /datum/gas_mixture/outpost
	surface_color       = COLOR_DARK_GREEN_GRAY
	water_color         = COLOR_BLUE_GRAY
	has_rings           = FALSE
	strata              = /decl/strata/sedimentary
	engraving_generator = new /datum/xenoarch_engraving_flavor
	starts_at_night     = FALSE
	day_duration        = 25 MINUTES
	surface_light_level = 0.8
	surface_light_color = COLOR_WHITE
	flora               = new /datum/flora_generator/outpost
	fauna               = null

/obj/effect/overmap/visitable/sector/planetoid/outpost
	name = "\proper Alpha"
	planetoid_id = "alpha"

/area/exoplanet/outpost

/datum/gas_mixture/outpost
	gas = list(
		/decl/material/gas/oxygen =   MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD,
	)

/datum/gas_mixture/outpost/New(_volume = CELL_VOLUME, _temperature = T0C + 21, _group_multiplier = 1)
	..(CELL_VOLUME, T0C + 21)
	update_values()

/datum/flora_generator/outpost
	flora_diversity = 6
	grass_color = "#407c40"
	plant_colors = list("#215a00","#195a47","#5a7467","#9eab88","#6e7248", "RANDOM")

//Spawn the planetoid data before we do SSatoms init
/obj/abstract/outpost_planetoid_spawner/New()
	var/datum/planetoid_data/planet_data = new /datum/planetoid_data/outpost
	SSmapping.register_planetoid(planet_data)
	SSmapping.register_planetoid_levels(z, planet_data)
	var/datum/level_data/surface_level_data = SSmapping.levels_by_z[z]
	surface_level_data.exterior_atmosphere = planet_data.atmosphere.Clone()

/obj/abstract/level_data_spawner/outpost
	level_data_type = /datum/level_data/planetoid/exoplanet/outpost

/datum/level_data/planetoid/exoplanet/outpost
	base_area = /area/exoplanet/outpost
	base_turf = /turf/exterior/wildgrass
	level_flags = ZLEVEL_PLAYER
	level_generators = list(
		/datum/random_map/automata/cave_system,
		/datum/random_map/noise/ore
	)

/obj/abstract/outpost_planetoid_spawner/Initialize()
	..()
	return INITIALIZE_HINT_QDEL