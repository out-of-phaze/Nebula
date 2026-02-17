// Swamp areas.
/area/homestead/witch_hut
	name = "Witches' Hut"
	fishing_failure_prob = 100
	fishing_results = list()
	area_flags = parent_type::area_flags | AREA_FLAG_ALLOW_LEVEL_PERSISTENCE | AREA_FLAG_NO_LEGACY_PERSISTENCE

/area/homestead/caves/river/swamp
	name = "Southern Silent River"

/area/homestead/outside/swamp
	name = "Swamp"
	description = "The reek of stagnant water and the chirp of insects filter through the humid air."
	forced_ambience = list('sound/ambience/marshy.ogg')
	area_flags = parent_type::area_flags | AREA_FLAG_ALLOW_LEVEL_PERSISTENCE | AREA_FLAG_NO_LEGACY_PERSISTENCE

/area/homestead/outside/swamp/poi
	name = "Deep Swamp"
	forced_ambience = list('sound/ambience/marshy.ogg')

/area/homestead/outside/river/swamp
	name = "Swampy River"
	description = "Mud squelches underfoot as the river broadens and splits, feeding a broad expanse of swamp and still water."
	area_flags = parent_type::area_flags | AREA_FLAG_ALLOW_LEVEL_PERSISTENCE | AREA_FLAG_NO_LEGACY_PERSISTENCE

/area/homestead/caves/swamp
	name = "Southern Deep Tunnels"
	forced_ambience = list('sound/ambience/marshy.ogg')

/area/homestead/caves/unexplored/swamp
	name = "Trackless Deeps - Far South"
