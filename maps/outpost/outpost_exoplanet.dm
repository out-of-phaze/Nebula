/datum/planetoid_data/outpost
	id                  = "alpha"
	name                = "\proper Alpha"
	topmost_level_id    = "alpha_outpost_surface"
	surface_level_id    = "alpha_outpost_surface"
	habitability_class  = HABITABILITY_IDEAL
	atmosphere          = /datum/gas_mixture/outpost
	surface_color       = COLOR_DARK_GREEN_GRAY
	water_color         = COLOR_BLUE_GRAY
	has_rings           = FALSE
	strata              = /decl/strata/sedimentary
	engraving_generator = /datum/xenoarch_engraving_flavor
	starts_at_night     = FALSE
	day_duration        = 25 MINUTES
	surface_light_level = 0.8
	surface_light_color = COLOR_WHITE
	flora               = /datum/planet_flora/random/outpost
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

/datum/planet_flora/random/outpost
	flora_diversity = 6
	grass_color = "#407c40"
	plant_colors = list("#215a00","#195a47","#5a7467","#9eab88","#6e7248", "RANDOM")

/obj/abstract/level_data_spawner/outpost
	level_data_type = /datum/level_data/planetoid/exoplanet/outpost

/datum/level_data/planetoid/exoplanet/outpost
	parent_planetoid = "alpha"
	level_id = "alpha_outpost_surface"
	base_area = /area/exoplanet/outpost
	base_turf = /turf/exterior/barren
	level_generators = list(
		/datum/random_map/automata/cave_system,
		/datum/random_map/noise/ore
	)

/obj/abstract/turbolift_spawner/outpost
	dir = 1
	depth = 2
	lift_size_x = 3
	lift_size_y = 3
	areas_to_use = list(
		/area/turbolift/space_elevator,
		/area/turbolift/space_elevator
	)

/datum/map_template/planetoid/outpost
	name                  = "Alpha"
	template_categories   = list(MAP_TEMPLATE_CATEGORY_PLANET)
	template_flags        = TEMPLATE_FLAG_SPAWN_GUARANTEED
	planetoid_data_type   = /datum/planetoid_data/outpost
	level_data_type       = null //We have our own level_data
	mappaths              = list(
		"maps/outpost/outpost-surface.dmm"
	)