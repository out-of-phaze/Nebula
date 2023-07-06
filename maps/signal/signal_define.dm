/world
	turf = /turf/exterior/seafloor

/datum/map/signal
	name =         "Yonaguni Dome"
	station_name = "Yonaguni Dome"
	full_name =    "Yonaguni Dome"
	path =         "signal"

	lobby_screens = list('maps/signal/lobby.png')
	lobby_tracks = list(
		/decl/music_track/torn,
		/decl/music_track/martiancowboy,
		/decl/music_track/nebula,
		/decl/music_track/monument
	)

	full_name     = "Yonaguni Dome"
	station_short = "Yonaguni"
	dock_name     = "Rhadamanthus Docks"
	boss_name     = "Administration"
	boss_short    = "Admin"
	company_name  = "Sol Colonial Administration"
	company_short = "CSA-CA"

	allowed_spawns = list(/decl/spawnpoint/arrivals)

	shuttle_docked_message =           "The crew transfer vessel has docked at the Escape arm. Traffic control reports that departure will occur in approximately %ETD%."
	shuttle_leaving_dock =             "The crew transfer vessel has left the Escape arm. Estimate %ETA% until arrival at %dock_name%."
	shuttle_called_message =           "A crew transfer has been scheduled for this shift and a vessel has been dispatched from %dock_name%. Estimated arrival time is %ETA%."
	shuttle_recall_message =           "The crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The evacuation vessel has docked at the Escape arm. Traffic control reports that departure will occur in approximately %ETD%."
	emergency_shuttle_leaving_dock =   "The evacuation vessel has left the Escape arm; escape pods now launching. Estimate %ETA% until arrival at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation has been initiated and a submersible is en route from %dock_name%. It will arrive in %ETA%"
	emergency_shuttle_recall_message = "The emergency evacuation has been cancelled."

	available_cultural_info = list(
		TAG_HOMEWORLD = list(
			/decl/cultural_info/location/mercury,
			/decl/cultural_info/location/venus,
			/decl/cultural_info/location/earth,
			/decl/cultural_info/location/earth/luna,
			/decl/cultural_info/location/mars,
			/decl/cultural_info/location/asteroids,
			/decl/cultural_info/location/jupiter,
			/decl/cultural_info/location/saturn,
			/decl/cultural_info/location/uranus,
			/decl/cultural_info/location/neptune,
			/decl/cultural_info/location/kuiperbelt,
			/decl/cultural_info/location/oort/eris,
			/decl/cultural_info/location/other
		),
		TAG_FACTION = list(
			/decl/cultural_info/faction/csa,
			/decl/cultural_info/faction/ts,
			/decl/cultural_info/faction/ltc,
			/decl/cultural_info/faction/firstwave,
			/decl/cultural_info/faction/outer,
			/decl/cultural_info/faction/inner,
			/decl/cultural_info/faction/cuchulain,
			/decl/cultural_info/faction/posthuman,
			/decl/cultural_info/faction/other
		),
		TAG_CULTURE = list(
			/decl/cultural_info/culture/sol,
			/decl/cultural_info/culture/mercury,
			/decl/cultural_info/culture/venus,
			/decl/cultural_info/culture/earth,
			/decl/cultural_info/culture/luna,
			/decl/cultural_info/culture/mars,
			/decl/cultural_info/culture/asteroids,
			/decl/cultural_info/culture/jupiter,
			/decl/cultural_info/culture/saturn,
			/decl/cultural_info/culture/uranus,
			/decl/cultural_info/culture/neptune,
			/decl/cultural_info/culture/kuiperbelt,
			/decl/cultural_info/culture/oort
		),
		TAG_RELIGION = list(
			/decl/cultural_info/religion/jewish,
			/decl/cultural_info/religion/hindu,
			/decl/cultural_info/religion/buddhist,
			/decl/cultural_info/religion/jain,
			/decl/cultural_info/religion/sikh,
			/decl/cultural_info/religion/muslim,
			/decl/cultural_info/religion/christian,
			/decl/cultural_info/religion/bahai,
			/decl/cultural_info/religion/agnostic,
			/decl/cultural_info/religion/deist,
			/decl/cultural_info/religion/atheist,
			/decl/cultural_info/religion/thelemite,
			/decl/cultural_info/religion/spiritualism,
			/decl/cultural_info/religion/shinto,
			/decl/cultural_info/religion/taoist,
			/decl/cultural_info/religion/other
		)
	)

	default_cultural_info = list(
		TAG_HOMEWORLD = /decl/cultural_info/location/jupiter/europa,
		TAG_FACTION =   /decl/cultural_info/faction/outer,
		TAG_CULTURE =   /decl/cultural_info/culture/jupiter,
		TAG_RELIGION =  /decl/cultural_info/religion/other
	)

/datum/map/signal/get_map_info()
	return "<b>Yonaguni Dome</b>, bored into the ice plains of Puthiya Natu, is permanent civilian research facility administrated by \
	the Central Solar government. It is old, remote and poorly funded, but hosts facilities dedicated to studying the sunken continent of \
	Lemuria, a mysterious expanse of alien ruins buried beneath kilometers of ice and dark water."

/decl/material/liquid/water/sea
	name = "seawater"
	codex_name = "seawater"
	uid = "liquid_seawater"
	gas_name = "seawater" // jank
	gas_condensation_point = null // double jank

/datum/level_data/main_level/signal
	exterior_atmosphere = list(/decl/material/liquid/water/sea = 10000) // taken from old Europa's Yonaguni map
	exterior_atmos_temp = T0C - 35 // a bit chilly
	base_turf = /turf/exterior/open/flooded

// z1 - seafloor
/datum/level_data/main_level/signal/seafloor
	base_turf = /turf/exterior/seafloor
	level_generators = list(
		/datum/random_map/noise/seafloor
	)

// z3 - flooded ice caves
/datum/level_data/main_level/signal/icecaves
	level_generators = list(
		/datum/random_map/automata/cave_system/ice_sheet/flooded
	)

// z4 - ice plains
/datum/level_data/main_level/signal/iceplain
	level_generators = list(
		/datum/random_map/noise/ice_plain
	)

/obj/abstract/level_data_spawner/signal
	level_data_type = /datum/level_data/main_level/signal

/obj/abstract/level_data_spawner/signal/seafloor
	level_data_type = /datum/level_data/main_level/signal/seafloor

/obj/abstract/level_data_spawner/signal/icecaves
	level_data_type = /datum/level_data/main_level/signal/icecaves

/obj/abstract/level_data_spawner/signal/iceplain
	level_data_type = /datum/level_data/main_level/signal/iceplain