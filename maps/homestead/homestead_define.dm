/datum/map/homestead
	name          = "homestead"
	full_name     = "Homestead"
	path          = "homestead"
	station_name  = "Homestead"
	station_short = "Homestead"
	dock_name     = "shaded heights"
	boss_name     = "the Splinter Kingdoms"
	boss_short    = "Splinter Kingdoms"
	company_name  = "whispers from the Deep"
	company_short = "the Deep"
	system_name   = "Downlands"
	default_spawn = /decl/spawnpoint/arrivals
	allowed_latejoin_spawns = list(
		/decl/spawnpoint/arrivals
	)
	map_tech_level       = MAP_TECH_LEVEL_MEDIEVAL
	survival_box_choices = list()
	passport_type        = null
	_available_backpacks = list(
		/decl/backpack_outfit/sack,
		/decl/backpack_outfit/backpack/crafted,
		/decl/backpack_outfit/haversack
	)
	lobby_tracks = list(
		/decl/music_track/dhaka,
		/decl/music_track/teller,
		/decl/music_track/suonatore,
		/decl/music_track/adventure,
	)
	credit_sound = list(
		'sound/music/Miris-Magic-Dance.ogg'
	)
	game_year = -914 // in 2024, the year should be 1110, roughly a century after the fall of the Imperial Aegis
	security_state = /decl/security_state/none

	char_preview_bgstate_options = list(
		"000",
		"midgrey",
		"FFF",
		"wood"  = /turf/floor/wood::color,
		"mud",
		"grass" = /turf/floor/grass::color,
		"rock"  = /turf/floor/rock/basalt::color,
		"brick" = /turf/wall/brick/sandstone::color
	)
	default_ui_style = /decl/ui_style/underworld

/decl/backpack_outfit/sack
	is_default = TRUE

/datum/map/homestead/get_map_info()
	return "You're in the wilderness of the [system_name], nestled between the mountains and the river and bisected by the decaying Queens' Road. On all sides, you are surrounded by untamed wilds. \
	Far from the control of [boss_name], you are free to carve forward a path to survival for yourself and your comrades however you wish. Strike the earth!"

/datum/map/homestead/get_available_submap_archetypes()
	return null // Return list of decl instances when relevant submaps exist.
