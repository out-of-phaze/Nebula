/datum/map/crux
	name = "crux"
	full_name = "NSS Southern Cross"
	path = "crux"
	station_name  = "NLS Southern Cross"
	station_short = "Southern Cross"
	dock_name     = "NCS Northern Star" // Now we're the centcom!
	boss_name     = "Central Command"
	boss_short    = "Centcom"
	company_name  = "NanoTrasen"
	company_short = "NT"

	lobby_screens = list('maps/crux/polaris.png')

	allowed_latejoin_spawns = list(
		/decl/spawnpoint/arrivals,
		/decl/spawnpoint/cryo,
		/decl/spawnpoint/cyborg
	)

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

/datum/level_data/crux
	name = "Southern Cross - Ground Floor"
	use_global_exterior_ambience = FALSE
	ambient_light_level = 0.7
	ambient_light_color = "#8497ec"
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

/obj/abstract/level_data_spawner/crux_ground_floor
	name = "Southern Cross - Ground Floor"
	level_data_type = /datum/level_data/crux

/datum/level_data/crux/level_one
	name = "Southern Cross - Level One"

/obj/abstract/level_data_spawner/crux_level_one
	name = "Southern Cross - Level One"
	level_data_type = /datum/level_data/crux/level_one

/datum/level_data/crux/level_two
	name = "Southern Cross - Level Two"
/obj/abstract/level_data_spawner/crux_level_two
	name = "Southern Cross - Level Two"
	level_data_type = /datum/level_data/crux/level_two

/obj/abstract/landmark/map_load_mark/engine_loader // todo
