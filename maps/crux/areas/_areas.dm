#define AMBIENCE_SPACE list('sound/ambience/ambispace1.ogg','sound/ambience/ambispace2.ogg','sound/ambience/ambispace3.ogg','sound/ambience/ambispace4.ogg','sound/ambience/ambispace5.ogg')

/datum/map/crux
	apc_test_exempt_areas = list(
		/area/exoplanet                                                   = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space                                                       = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/turbolift                                                   = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crux/engineering/construction1                              = NO_SCRUBBER|NO_VENT,
		/area/crux/engineering/construction2                              = NO_SCRUBBER|NO_VENT,
		/area/crux/engineering/construction3                              = NO_SCRUBBER|NO_VENT,
		/area/crux/engineering/construction4                              = NO_SCRUBBER|NO_VENT,
		/area/crux/engineering/construction5                              = NO_SCRUBBER|NO_VENT,
		/area/crux/engineering/construction/sd_construction               = NO_SCRUBBER|NO_VENT,
		/area/crux/outside                                                = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crux/outside/level_one                                      = NO_VENT|NO_APC,
		/area/crux/outside/roof                                           = 0,
		/area/crux/outside/roof/balcony_south                             = NO_SCRUBBER|NO_VENT,
		/area/crux/outside/roof/garden                                    = NO_SCRUBBER|NO_VENT,
		/area/crux/shuttle                                                = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crux/shuttle/shuttle_start_2                                = NO_SCRUBBER|NO_APC,
		/area/crux/shuttle/shuttle_start                                  = NO_SCRUBBER|NO_APC,
		/area/crux/storage/emergency                                      = NO_SCRUBBER|NO_VENT,
		/area/crux/science/test_area                                      = NO_SCRUBBER|NO_VENT,
		/area/crux/habitation/bar                                         = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/library                                    = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/medbay                                     = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/firstdeck                                  = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/firstdeck/foreport                         = NO_SCRUBBER,
		/area/crux/maintenance/firstdeck/forestarboard                    = NO_SCRUBBER,
		/area/crux/maintenance/substation                                 = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/robotics                                   = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/emergencyeva                               = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/medbay_fore                                = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/research_medical                           = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/engineering                                = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/bar                                        = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/disposal                                   = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/apmaint                                    = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/central                                    = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/thirddeck                                  = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/security_starboard                         = NO_SCRUBBER|NO_VENT,
		/area/crux/maintenance/solars/aftportsolar                        = NO_SCRUBBER,
		/area/crux/maintenance/solars/aftstarboardsolar                   = NO_SCRUBBER,
		/area/crux/maintenance/cargo                                      = NO_SCRUBBER,
		/area/crux/maintenance/research                                   = NO_SCRUBBER,
		/area/crux/maintenance/solars/foreportsolar                       = NO_SCRUBBER,
		/area/crux/maintenance/solars/forestarboardsolar                  = NO_SCRUBBER,
		/area/crux/network/comms/chamber                                  = NO_SCRUBBER,
		/area/crux/network/server                                         = NO_SCRUBBER,
		/area/crux/medical/genetics                                       = NO_APC
	)
	area_coherency_test_exempt_areas = list(
		/area/space,
		/area/crux/outside,
		/area/crux/outside/level_one,
		/area/crux/outside/level_two
	)

/area/crux
	has_gravity = TRUE
