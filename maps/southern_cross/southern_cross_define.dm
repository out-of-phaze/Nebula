/datum/map/southern_cross
	name = "southern_cross"
	full_name = "NSS Southern Cross"
	path = "southern_cross"
	station_name  = "NLS Southern Cross"
	station_short = "Southern Cross"
	dock_name     = "NCS Northern Star" // Now we're the centcom!
	boss_name     = "Central Command"
	boss_short    = "Centcom"
	company_name  = "NanoTrasen"
	company_short = "NT"

	lobby_screens = list('maps/southern_cross/polaris.png')

	shuttle_docked_message = "The scheduled shuttle to the %dock_name% has docked with the station at docks one and two. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Crew Transfer Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	shuttle_called_message = "A crew transfer to %dock_name% has been scheduled. The shuttle has been called. Those leaving should proceed to docks one and two in approximately %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The Emergency Shuttle has docked with the station at docks one and two. You have approximately %ETD% to board the Emergency Shuttle."
	emergency_shuttle_leaving_dock = "The Emergency Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation shuttle has been called. It will arrive at docks one and two in approximately %ETA%."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled."

	overmap_ids = list(OVERMAP_ID_SPACE)

	default_telecomms_channels = list(
		COMMON_FREQUENCY_DATA,
		list("name" = "Entertainment", "key" = "z", "frequency" = 1461, "color" = COMMS_COLOR_ENTERTAIN, "span_class" = CSS_CLASS_RADIO, "receive_only" = TRUE),
		list("name" = "Command",       "key" = "c", "frequency" = 1353, "color" = COMMS_COLOR_COMMAND,   "span_class" = "comradio", "secured" = list(access_bridge)),
		list("name" = "Security",      "key" = "s", "frequency" = 1359, "color" = COMMS_COLOR_SECURITY,  "span_class" = "secradio", "secured" = list(access_security)),
		list("name" = "Engineering",   "key" = "e", "frequency" = 1357, "color" = COMMS_COLOR_ENGINEER,  "span_class" = "engradio", "secured" = list(access_engine)),
		list("name" = "Medical",       "key" = "m", "frequency" = 1355, "color" = COMMS_COLOR_MEDICAL,   "span_class" = "medradio", "secured" = list(access_medical)),
		list("name" = "Science",       "key" = "n", "frequency" = 1351, "color" = COMMS_COLOR_SCIENCE,   "span_class" = "sciradio", "secured" = list(access_research)),
		list("name" = "Service",       "key" = "v", "frequency" = 1349, "color" = COMMS_COLOR_SERVICE,   "span_class" = "srvradio", "secured" = list(access_bar)),
		list("name" = "Supply",        "key" = "u", "frequency" = 1347, "color" = COMMS_COLOR_SUPPLY,    "span_class" = "supradio", "secured" = list(access_cargo)),
		list("name" = "Exploration",   "key" = "x", "frequency" = 1361, "color" = COMMS_COLOR_EXPLORER , "span_class" = "EXPradio", "secured" = list(access_eva)),
		list("name" = "AI Private",    "key" = "p", "frequency" = 1343, "color" = COMMS_COLOR_AI,        "span_class" = "airadio",  "secured" = list(access_ai_upload))
	)

/datum/level_data/southern_cross
	name = "Southern Cross - Deck One"
/obj/abstract/level_data_spawner/southern_cross_deck_one
	name = "Southern Cross - Deck One"
	level_data_type = /datum/level_data/southern_cross

/datum/level_data/southern_cross/deck_two
	name = "Southern Cross - Deck Two"
/obj/abstract/level_data_spawner/southern_cross_deck_two
	name = "Southern Cross - Deck Two"
	level_data_type = /datum/level_data/southern_cross/deck_two

/datum/level_data/southern_cross/deck_three
	name = "Southern Cross - Deck Three"
/obj/abstract/level_data_spawner/southern_cross_deck_three
	name = "Southern Cross - Deck Three"
	level_data_type = /datum/level_data/southern_cross/deck_three

/datum/level_data/southern_cross/centcomm
	name = "Southern Cross - Central Command"
/obj/abstract/level_data_spawner/southern_cross_centcomm
	name = "Southern Cross - Central Command"
	level_data_type = /datum/level_data/southern_cross/centcomm

/datum/level_data/southern_cross/outpost
	name = "Southern Cross - Outpost"
	level_id = "southern_cross_outpost"
	use_global_exterior_ambience = FALSE
	ambient_light_level = 0.7
	ambient_light_color = "#8497ec"
	base_turf = /turf/exterior/dirt
	exterior_atmosphere = list(
		/decl/material/gas/oxygen =   MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
	connected_levels = list("southern_cross_caves" = NORTH)
	strata = /decl/strata/sedimentary
/obj/abstract/level_data_spawner/southern_cross_outpost
	name = "Southern Cross - Outpost"
	level_data_type = /datum/level_data/southern_cross/outpost

/datum/level_data/southern_cross/outpost/generate_level()
	..()
	new /datum/random_map/noise/sif(1, 1, level_z, world.maxx, world.maxy)

/datum/level_data/southern_cross/wilderness
	name = "Southern Cross - Wilderness"
	level_id = "southern_cross_wilderness"
	use_global_exterior_ambience = FALSE
	ambient_light_level = 0.7
	ambient_light_color = "#8497ec"
	base_turf = /turf/exterior/dirt
	exterior_atmosphere = list(
		/decl/material/gas/oxygen =   MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
	connected_levels = list("southern_cross_caves" = SOUTH)
	strata = /decl/strata/sedimentary
/obj/abstract/level_data_spawner/southern_cross_wilderness
	name = "Southern Cross - Wilderness"
	level_data_type = /datum/level_data/southern_cross/wilderness

/datum/level_data/southern_cross/wilderness/generate_level()
	..()
	new /datum/random_map/noise/sif/forest(1, 1, level_z, world.maxx, world.maxy)

/datum/level_data/southern_cross/mining
	name = "Southern Cross Caves"
	level_id = "southern_cross_caves"
	use_global_exterior_ambience = FALSE
	ambient_light_level = 0.7
	ambient_light_color = "#8497ec"
	base_turf = /turf/exterior/dirt
	exterior_atmosphere = list(
		/decl/material/gas/oxygen =   MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
	connected_levels = list(
		"southern_cross_wilderness" = NORTH,
		"southern_cross_outpost" = SOUTH
	)
	strata = /decl/strata/sedimentary
/obj/abstract/level_data_spawner/southern_cross_mining
	name = "Southern Cross Caves"
	level_data_type = /datum/level_data/southern_cross/mining

/datum/level_data/southern_cross/mining/generate_level()
	..()
	new /datum/random_map/automata/cave_system(1, 1, level_z, world.maxx, world.maxy)
	new /datum/random_map/noise/sif/underground(1, 1, level_z, world.maxx, world.maxy)
	new /datum/random_map/noise/ore(1, 1, level_z, 64, 64) // Create the mining ore distribution map.

/datum/random_map/noise/sif
	descriptor = "Sif plains (roundstart)"
	smoothing_iterations = 3
	target_turf_type = /turf/unsimulated/mask
	smooth_single_tiles = TRUE
	var/refresh_icons_post_apply = TRUE

/datum/random_map/noise/sif/cleanup()
	..()
	// Round down to 1-9.
	for(var/x = 1, x <= limit_x, x++)
		for(var/y = 1, y <= limit_y, y++)
			var/current_cell = TRANSLATE_COORD(x,y)
			var/current_val = map[current_cell]
			map[current_cell] = min(9,max(0,round((current_val/cell_range)*10)))

/datum/random_map/noise/sif/apply_to_map()
	..()
	if(refresh_icons_post_apply)
		for(var/x = 1, x <= limit_x, x++)
			for(var/y = 1, y <= limit_y, y++)
				var/turf/exterior/T = locate((origin_x-1)+x,(origin_y-1)+y,origin_z)
				if(istype(T))
					T.update_icon()

/datum/random_map/noise/sif/get_appropriate_path(var/value)
	switch(value)
		if(0)
			return /turf/exterior/mud
		if(1 to 2)
			return /turf/exterior/dirt
		if(3 to 5)
			return /turf/exterior/sif_growth
		if(6 to 8)
			return /turf/exterior/sif_growth/thick
		if(9)
			return /turf/exterior/snow

/datum/random_map/noise/sif/get_additional_spawns(var/value, var/turf/T)
	if(prob(45) || T.density)
		return
	switch(value)
		if(1 to 2)
			if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
			else if(prob(1))
				new /obj/structure/flora/mushroom(T)
		if(3 to 4)
			if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)
			else if(prob(1))
				new /obj/structure/flora/mushroom(T)
		if(5 to 6)
			if(prob(1))
				new /obj/structure/flora/tree/sif(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)
			else if(prob(1))
				new /obj/structure/flora/sif/frostbelle(T)
			else if (prob(1))
				new /obj/structure/flora/sif/eyes(T)
		if(7 to 8)
			if(prob(5))
				new /obj/structure/flora/tree/sif(T)
			else if(prob(1))
				new /obj/structure/flora/sif/frostbelle(T)
			else if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)

/datum/random_map/noise/sif/forest
	descriptor = "Sif forest (roundstart)"

/datum/random_map/noise/sif/forest/get_appropriate_path(var/value)
	switch(value)
		if(0 to 3)
			return /turf/exterior/sif_growth
		if(4 to 6)
			return /turf/exterior/sif_growth/thick
		if(7 to 9)
			return /turf/exterior/snow

/datum/random_map/noise/sif/forest/get_additional_spawns(var/value, var/turf/T)
	if(prob(25) || T.density)
		return
	switch(value)
		if(0 to 5)
			if(value >= 3 && prob(5))
				new /obj/structure/flora/tree/sif(T)
				return
			if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)
			else if(prob(1))
				new /obj/structure/flora/mushroom(T)
		if(6 to 9)
			if(prob((value <= 7) ? 15 : 35))
				new /obj/structure/flora/tree/sif(T)
				return
			if(prob(1))
				new /obj/structure/flora/sif/frostbelle(T)
			else if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)

/datum/random_map/noise/sif/underground
	descriptor = "Sif underground (roundstart)"
	target_turf_type = /turf/exterior/wall

/datum/random_map/noise/sif/underground/get_appropriate_path(var/value)
	switch(value)
		if(0 to 2)
			return /turf/exterior/mud
		if(3 to 4)
			return /turf/exterior/dirt

/datum/random_map/noise/sif/underground/get_additional_spawns(var/value, var/turf/T)
	if(value <= 1 && prob(30)) // Mud is very fun-gy.
		new /obj/structure/flora/mushroom(T)
	else if(!prob(30))
		var/mushroom_prob = 0
		switch(value)
			if(2)
				mushroom_prob = 8
			if(3)
				mushroom_prob = 4
			if(4 to 6)
				mushroom_prob = 2
			if(7)
				mushroom_prob = 1
		if(mushroom_prob && prob(mushroom_prob))
			new /obj/structure/flora/mushroom(T)
		else if(prob(0.1))
			new /obj/structure/flora/sif/subterranean(T)
