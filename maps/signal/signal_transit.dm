/obj/abstract/turbolift_spawner/signal
	name = "Yonaguni elevator placeholder"
	depth = 4
	lift_size_x = 4
	lift_size_y = 4
	icon = 'maps/signal/icons/turbolift.dmi'
	door_type =     null
	wall_type =     null
	firedoor_type = null
	light_type =    null
	floor_type =  /turf/simulated/floor/tiled/steel_grid
	button_type = /obj/structure/lift/button/standalone
	panel_type =  /obj/structure/lift/panel/standalone
	areas_to_use = list(
		/area/turbolift/signal_first,
		/area/turbolift/signal_second,
		/area/turbolift/signal_third,
		/area/turbolift/signal_fourth
	)
	floor_departure_sound = 'sound/effects/lift_heavy_start.ogg'
	floor_arrival_sound =   'sound/effects/lift_heavy_stop.ogg'

/area/turbolift/signal_first
	name = "Hangar Sublevel"
	base_turf = /turf/simulated/floor
	open_turf = /turf/simulated/floor // to stop it from opening to the ocean and flooding the station

/area/turbolift/signal_second
	name = "Operations Sublevel"
	base_turf = /turf/simulated/open

/area/turbolift/signal_third
	name = "Ground Floor"
	base_turf = /turf/simulated/open

/area/turbolift/signal_fourth
	name = "Roof Access"
	base_turf = /turf/simulated/open
