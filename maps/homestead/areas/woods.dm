// Woodland areas.
/area/homestead/caves/river/woods
	name = "Northern Silent River"

/area/homestead/outside/river/lake
	name = "Woodland Lake"
	forced_ambience = list('sound/ambience/shore.ogg')
	area_flags = parent_type::area_flags | AREA_FLAG_ALLOW_LEVEL_PERSISTENCE | AREA_FLAG_NO_LEGACY_PERSISTENCE

/area/homestead/outside/river/lake/get_additional_fishing_results()
	var/static/list/additional_fishing_results = list(
		/mob/living/simple_animal/aquatic/fish/large/bass    = 5,
		/mob/living/simple_animal/aquatic/fish/large/trout   = 5,
		/mob/living/simple_animal/aquatic/fish/large/javelin = 5,
		/mob/living/simple_animal/hostile/aquatic/carp       = 3,
		/mob/living/simple_animal/aquatic/fish/large/koi     = 1
	)
	return additional_fishing_results

/area/homestead/outside/woods
	name = "Woodlands"
	sound_env = FOREST
	area_flags = parent_type::area_flags | AREA_FLAG_ALLOW_LEVEL_PERSISTENCE | AREA_FLAG_NO_LEGACY_PERSISTENCE

/area/homestead/outside/woods/poi
	name = "Deep Woodlands"

/area/homestead/outside/river/woods
	name = "Woodland River"

/area/homestead/caves/woods
	name = "Northern Deep Tunnels"

/area/homestead/caves/unexplored/woods
	name = "Trackless Deeps - Far North"

/area/homestead/forester_hut
	name = "\improper Foresters' Hut"
	sound_env = STANDARD_STATION
	fishing_failure_prob = 100
	fishing_results = list()
	area_flags = parent_type::area_flags | AREA_FLAG_ALLOW_LEVEL_PERSISTENCE | AREA_FLAG_NO_LEGACY_PERSISTENCE
