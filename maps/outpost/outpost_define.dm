/datum/map/outpost
	name = "Outpost"
	full_name = "the Frontier"
	station_name = "the Frontier"
	station_short = "the Frontier"
	system_name = "the Frontier"
	welcome_sound = 'maps/outpost/sound/achtung.ogg'
	path = "outpost"
	allowed_spawns = list()
	default_spawn = null
	overmap_ids = list(OVERMAP_ID_SPACE)
	//num_exoplanets = 3
	//away_site_budget = 5
	default_job_type = null

/datum/map/outpost/get_map_info()
	return "You're aboard a vessel or outpost in <b>[station_name],</b> the edge of the explored territory in space. \
	No meaningful authorities can claim the planets and resources in this frontier sector, so their exploitation is entirely up to you - mine, poach and deforest all you want."