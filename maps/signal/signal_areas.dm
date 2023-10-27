/area/europa_exterior
	name = "\improper Ocean Floor"
	icon = 'maps/signal/icons/areas.dmi'
	icon_state = "ocean_deep"
	requires_power =   1
	always_unpowered = 1
	dynamic_lighting = TRUE
	power_light =   0
	power_equip =   0
	power_environ = 0
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_RAD_SHIELDED
	base_turf = /turf/exterior/seafloor
	turf_initializer = /decl/turf_initializer/ocean
	//open_turf = /turf/exterior/open
	color = COLOR_LIQUID_WATER
	is_outside = OUTSIDE_NO

/area/europa_exterior/mid
	name = "\improper Ocean Deeps"
	icon_state = "ocean_mid"

/area/europa_exterior/upper
	name = "\improper Ocean Shallows"
	icon_state = "ocean_shallow"
	is_outside = OUTSIDE_YES

/area/europa_exterior/surface // Surface of Puthiya Natu
	name = "\improper Lemurian Plains" // Lemuria being the sunken continent the facility is built over
	icon_state = "surface"
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND
	color = COLOR_SKY_BLUE
	is_outside = OUTSIDE_YES

/area/europa_exterior/heights
	name = "\improper Lemurian Heights"
	icon_state = "surface_heights"
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND
	is_outside = OUTSIDE_YES

/area/europa
	name = "\improper Construction Site"
	icon = 'maps/signal/icons/areas.dmi'
	icon_state = "built"
	base_turf = /turf/simulated/floor
	color = COLOR_GRAY
	turf_initializer = /decl/turf_initializer/ocean

/area/europa/Initialize()
	color = null
	. = ..()

/area/europa/pillar
	name = "\improper North Pillar Base"
	color = COLOR_GRAY15
	icon_state = "pillar"

/area/europa/pillar/south
	name = "\improper South Pillar Base"
	color = COLOR_GRAY20

/area/europa/pillar/east
	name = "\improper East Pillar Base"
	color = COLOR_GRAY40

/area/europa/pillar/west
	name = "\improper West Pillar Base"
	color = COLOR_GRAY80

/area/europa/hangar
	name = "\improper Hangar Level - Elevator"
	color = COLOR_GREEN
	icon_state = "hangar"

/area/europa/hangar/south_maintenance
	name = "\improper Hangar Level - South Maintenance"
	color = COLOR_BLUE
	turf_initializer = /decl/turf_initializer/maintenance/ocean

/area/europa/hangar/north_maintenance
	name = "\improper Hangar Level - North Maintenance"
	color = COLOR_RED
	turf_initializer = /decl/turf_initializer/maintenance/ocean

/area/europa/hangar/north
	name = "\improper Hangar Level - North Chamber"
	color = COLOR_YELLOW

/area/europa/hangar/south
	name = "\improper Hangar Level - South Chamber"
	color = COLOR_PURPLE

/area/europa/hangar/northeast
	name = "\improper Hangar Level - Northeast Chamber"
	color = COLOR_PURPLE_GRAY

/area/europa/hangar/northwest
	name = "\improper Hangar Level - Northwest Chamber"
	color = COLOR_GREEN_GRAY

/area/europa/hangar/southeast
	name = "\improper Hangar Level - Southeast Chamber"
	color = COLOR_ORANGE

/area/europa/hangar/southwest
	name = "\improper Hangar Level - Southwest Chamber"
	color = COLOR_BROWN

/area/europa/operations
	name = "\improper Operations Level - Elevator"
	icon_state = "ops"
	color = COLOR_BLUE

/area/europa/operations/north
	name = "\improper Operations Level - Northern Wing"
	color = COLOR_DARK_ORANGE

/area/europa/operations/north_maint
	name = "\improper Operations Level - Northern Maintenance"
	color = COLOR_DARK_BROWN
	turf_initializer = /decl/turf_initializer/maintenance/ocean

/area/europa/operations/east_maint
	name = "\improper Operations Level - Eastern Maintenance"
	color = COLOR_SABER_BLUE
	turf_initializer = /decl/turf_initializer/maintenance/ocean

/area/europa/operations/south_maint
	name = "\improper Operations Level - Southern Maintenance"
	color = COLOR_AMBER
	turf_initializer = /decl/turf_initializer/maintenance/ocean

/area/europa/operations/west_maint
	name = "\improper Operations Level - Western Maintenance"
	color = COLOR_CHESTNUT
	turf_initializer = /decl/turf_initializer/maintenance/ocean

/area/europa/operations/northeast_central
	name = "\improper Operations Level - Northeastern Central Chamber"
	color = COLOR_DARK_BLUE_GRAY

/area/europa/operations/northwest_central
	name = "\improper Operations Level - Northwestern Central Chamber"
	color = COLOR_BEIGE

/area/europa/operations/west_central
	name = "\improper Operations Level - Western Chamber"
	color = COLOR_BEASTY_BROWN

/area/europa/operations/east_central
	name = "\improper Operations Level - Eastern Chamber"
	color = COLOR_BABY_BLUE

/area/europa/operations/southeast_central
	name = "\improper Operations Level - Southeastern Central Chamber"
	color = COLOR_GREEN_GRAY

/area/europa/operations/southwest_central
	name = "\improper Operations Level - Southwestern Central Chamber"
	color = COLOR_GREEN

/area/europa/operations/east
	name = "\improper Operations Level - Eastern Wing"
	color = COLOR_RED_LIGHT

/area/europa/operations/west
	name = "\improper Operations Level - Western Wing"
	color = COLOR_RED_GRAY

/area/europa/operations/south
	name = "\improper Operations Level - Southern Wing"
	color = COLOR_RED

/area/europa/surface
	name = "\improper Surface - Elevator"
	icon_state = "surface"
	color = COLOR_ACID_CYAN

/area/europa/surface/foyer
	name = "\improper Surface - Foyer"
	color = COLOR_ALUMINIUM

/area/europa/surface/checkpoint
	name = "\improper Surface - Entry Checkpoint"
	color = COLOR_AMBER

/area/europa/surface/police_lockers
	name = "\improper Surface - Police Lockers"
	color = COLOR_BABY_BLUE

/area/europa/surface/police_office
	name = "\improper Surface - Police Office"
	color = COLOR_BEASTY_BROWN

/area/europa/surface/south_maint
	name = "\improper Surface - Southern Maintenance"
	color = COLOR_BLOOD_HUMAN
	turf_initializer = /decl/turf_initializer/maintenance/ocean

/area/europa/surface/north_maint
	name = "\improper Surface - Northern Maintenance"
	color = COLOR_BLUE
	turf_initializer = /decl/turf_initializer/maintenance/ocean

/area/europa/surface/roof
	name = "\improper Surface - Roof Access"
	color = COLOR_BLUE_GRAY

/area/europa/surface/northwest
	name = "\improper Surface - Northwestern Chamber"
	color = COLOR_BLUE_LIGHT

/area/europa/surface/west_one
	name = "\improper Surface - Western Chamber One"
	color = COLOR_BOTTLE_GREEN

/area/europa/surface/west_two
	name = "\improper Surface - Western Chamber Two"
	color = COLOR_BRASS

/area/europa/surface/south
	name = "\improper Surface - Southern Chamber"
	color = COLOR_BRONZE

/area/europa/surface/southeast
	name = "\improper Surface - Southeastern Chamber"
	color = COLOR_BROWN

/area/europa/heights
	name = "\improper Roof - Elevator"
	color = COLOR_BROWN
	icon_state = "surface_heights"

/area/europa/heights/access
	name = "\improper Roof - Access"
	color = COLOR_BEASTY_BROWN

/area/europa/heights/landing
	name = "\improper Roof - Landing"
	color = COLOR_GREEN

/area/europa/heights/exterior
	name = "\improper Roof - Exterior"
	color = COLOR_BLUE
