#define MAP_TEMPLATE_CATEGORY_WILDERNESS    "crux_wilderness_template"
#define MAP_TEMPLATE_CATEGORY_OCEAN_FLOOR   "crux_ocena_floor_template"
#define MAP_TEMPLATE_CATEGORY_OCEAN_MINE    "crux_ocean_mine_template"
#define MAP_TEMPLATE_CATEGORY_OCEAN_SURFACE "crux_ocean_surface_template"

/datum/map_template/crux/downed_fighter
	name = "Downed Fighter"
	mappaths = list("maps/crux/submaps/pois/downed_fighter.dmm")
	template_categories = list(MAP_TEMPLATE_CATEGORY_OCEAN_FLOOR)

/datum/map_template/crux/eel_den
	name = "Eel Den"
	mappaths = list("maps/crux/submaps/pois/eel_den.dmm")
	template_categories = list(MAP_TEMPLATE_CATEGORY_OCEAN_FLOOR)

/datum/map_template/crux/nakhayl_dwelling
	name = "Nakhayl Dwelling"
	mappaths = list("maps/crux/submaps/pois/nakhayl_dwelling.dmm")
	template_categories = list(MAP_TEMPLATE_CATEGORY_WILDERNESS)

/datum/map_template/crux/nakhayl_fighter
	name = "Nakhayl Fighter"
	mappaths = list("maps/crux/submaps/pois/nakhayl_fighter.dmm")
	template_categories = list(MAP_TEMPLATE_CATEGORY_OCEAN_FLOOR)

/datum/map_template/crux/nutesh_ruins
	name = "Nutesh Ruins"
	mappaths = list("maps/crux/submaps/pois/nutesh_ruins.dmm")
	template_categories = list(MAP_TEMPLATE_CATEGORY_OCEAN_SURFACE)

/datum/map_template/crux/spider_den
	name = "Spider Den"
	mappaths = list("maps/crux/submaps/pois/spider_den.dmm")
	template_categories = list(MAP_TEMPLATE_CATEGORY_OCEAN_MINE)

/obj/abstract/landmark/boom_mark
	var/devastation_range  = 1
	var/heavy_impact_range = 2
	var/light_impact_range = 3
	var/flash_range        = 4

/obj/abstract/landmark/boom_mark/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/abstract/landmark/boom_mark/LateInitialize()
	var/boom_loc = get_turf(src)
	qdel(src)
	explosion(boom_loc, devastation_range, heavy_impact_range, light_impact_range, flash_range)