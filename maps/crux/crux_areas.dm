#define AMBIENCE_SPACE list('sound/ambience/ambispace1.ogg','sound/ambience/ambispace2.ogg','sound/ambience/ambispace3.ogg','sound/ambience/ambispace4.ogg','sound/ambience/ambispace5.ogg')

/datum/map/crux
	apc_test_exempt_areas = list(
		/area/exoplanet                                              = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/engineering/engine_room                                = NO_SCRUBBER|NO_VENT|NO_APC, // TODO port engine
		/area/engineering/engine_waste                               = NO_SCRUBBER|NO_VENT|NO_APC, // TODO port engine
		/area/holodeck                                               = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/surface                                                = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/surface/level_one                                      = NO_VENT|NO_APC,
		/area/space                                                  = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/turbolift                                              = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle                                                = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/solar                                                  = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle/shuttle_start_2                                = NO_SCRUBBER|NO_APC,
		/area/shuttle/shuttle_start                                  = NO_SCRUBBER|NO_APC,
		/area/construction/firstdeck                                 = NO_SCRUBBER|NO_VENT,
		/area/construction/seconddeck/construction1                  = NO_SCRUBBER|NO_VENT,
		/area/storage/emergency_storage                              = NO_SCRUBBER|NO_VENT,
		/area/security/riot_control                                  = NO_SCRUBBER|NO_VENT,
		/area/rnd/test_area                                          = NO_SCRUBBER|NO_VENT,
		/area/maintenance/firstdeck                                  = NO_SCRUBBER|NO_VENT,
		/area/maintenance/firstdeck/foreport                         = NO_SCRUBBER,
		/area/maintenance/firstdeck/forestarboard                    = NO_SCRUBBER,
		/area/maintenance/substation                                 = NO_SCRUBBER|NO_VENT,
		/area/maintenance/robotics                                   = NO_SCRUBBER|NO_VENT,
		/area/maintenance/emergencyeva                               = NO_SCRUBBER|NO_VENT,
		/area/maintenance/medbay_fore                                = NO_SCRUBBER|NO_VENT,
		/area/maintenance/research_medical                           = NO_SCRUBBER|NO_VENT,
		/area/maintenance/engineering                                = NO_SCRUBBER|NO_VENT,
		/area/maintenance/chapel                                     = NO_SCRUBBER|NO_VENT,
		/area/maintenance/bar                                        = NO_SCRUBBER|NO_VENT,
		/area/maintenance/locker                                     = NO_SCRUBBER|NO_VENT,
		/area/maintenance/disposal                                   = NO_SCRUBBER|NO_VENT,
		/area/maintenance/apmaint                                    = NO_SCRUBBER|NO_VENT,
		/area/maintenance/central                                    = NO_SCRUBBER|NO_VENT,
		/area/maintenance/thirddeck                                  = NO_SCRUBBER|NO_VENT,
		/area/maintenance/security_starboard                         = NO_SCRUBBER|NO_VENT,
		/area/maintenance/solars/aftportsolar                        = NO_SCRUBBER,
		/area/maintenance/solars/aftstarboardsolar                   = NO_SCRUBBER,
		/area/maintenance/security_port                              = NO_SCRUBBER,
		/area/maintenance/medbay                                     = NO_SCRUBBER,
		/area/maintenance/cargo                                      = NO_SCRUBBER,
		/area/maintenance/research                                   = NO_SCRUBBER,
		/area/maintenance/solars/foreportsolar                       = NO_SCRUBBER,
		/area/maintenance/solars/forestarboardsolar                  = NO_SCRUBBER,
		/area/tcomm/chamber                                          = NO_SCRUBBER,
		/area/server                                                 = NO_SCRUBBER,
		/area/medical/genetics                                       = NO_APC
	)
	area_coherency_test_exempt_areas = list(
		/area/space,
		/area/surface,
		/area/surface/level_one,
		/area/surface/level_two
	)

//Planetside
/area
/area/surface
	name = "\improper Crux Surface"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/surface/level_one
	name = "\improper Crux Exterior"

/area/surface/level_two
	name = "\improper Crux Heights"

/area/turbolift
	name = "\improper Turbolift"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

// Elevator areas.
/area/turbolift/port_deck_one
	name = "lift (ground floor)"
	lift_floor_label = "Ground Floor"
	lift_floor_name = "Ground Floor"
	lift_announce_str = "Arriving at Ground Floor: Main Hangars. Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/port_deck_two
	name = "lift (first floor)"
	lift_floor_label = "First Floor"
	lift_floor_name = "First Floor"
	lift_announce_str = "Arriving at First Floor: Operations. Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/starboard_deck_one
	name = "lift (ground floor)"
	lift_floor_label = "Ground Floor"
	lift_floor_name = "Ground Floor"
	lift_announce_str = "Arriving at Ground Floor: Main Hangars. Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/starboard_deck_two
	name = "lift (first floor)"
	lift_floor_label = "First Floor"
	lift_floor_name = "First Floor"
	lift_announce_str = "Arriving at First Floor: Operations. Engineering. Cargo. Medbay. Research. Security. Crew Facilities, Shuttle Docks. Cryogenic Storage."

/area/turbolift/center_deck_one
	name = "lift (ground floor)"
	lift_floor_label = "Ground Floor"
	lift_floor_name = "Ground Floor"
	lift_announce_str = "Arriving at Ground Floor: Main Hangars. Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/center_deck_two
	name = "lift (first floor)"
	lift_floor_label = "First Floor"
	lift_floor_name = "First Floor"
	lift_announce_str = "Arriving at First Floor: Operations. Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/center_deck_three
	name = "lift (second floor)"
	lift_floor_label = "Second Floor"
	lift_floor_name = "Second Floor"
	lift_announce_str = "Arriving at Second Floor: Command. Bridge. Meeting Room. Command Quarters. AI Core. Solars."

/area/turbolift/cargo_deck_one
	name = "lift (ground floor)"
	lift_floor_label = "Ground Floor"
	lift_floor_name = "Ground Floor"
	lift_announce_str = "Arriving at Cargo Delivery."
	base_turf = /turf/simulated/floor

/area/turbolift/cargo_deck_two
	name = "lift (first floor)"
	lift_floor_label = "First Floor"
	lift_floor_name = "First Floor"
	lift_announce_str = "Arriving at Cargo."

//Ground floor (Z-1)

/area/engineering/auxiliary_engineering
	name = "\improper Auxiliary Engineering Station"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/firstdeck/gym
	name = "\improper Station Gym"
	icon_state = "fitness"

/area/construction/firstdeck
	name = "\improper Engineering Construction Area"
	icon_state = "construction"

/area/construction/firstdeck/construction1
	name = "\improper Ground Floor Engineering Construction Area 1"

/area/construction/firstdeck/construction2
	name = "\improper Ground Floor Engineering Construction Area 2"

/area/construction/firstdeck/construction3
	name = "\improper Ground Floor Engineering Construction Area 3"

/area/construction/firstdeck/construction4
	name = "\improper Ground Floor Engineering Construction Area 4"

/area/construction/firstdeck/construction5
	name = "\improper Ground Floor Engineering Construction Area 5"

/area/crew_quarters/toilet
	name = "\improper Toilets"

/area/crew_quarters/toilet/firstdeck
	name = "\improper Ground Floor Restroom"

/area/crew_quarters/toilet/seconddeck/south
	name = "\improper First Floor South Restroom"

/area/maintenance/firstdeck
	name = "Ground Floor Maintenance"
	icon_state = "maintcentral"

/area/maintenance/firstdeck/aftstarboard
	name = "Ground Floor Southeast Maintenance"
	icon_state = "asmaint"

/area/maintenance/firstdeck/aftport
	name = "Ground Floor Southwest Maintenance"
	icon_state = "apmaint"

/area/maintenance/firstdeck/forestarboard
	name = "Ground Floor Northeast Maintenance"
	icon_state = "fsmaint"

/area/maintenance/firstdeck/foreport
	name = "Ground Floor Northwest Maintenance"
	icon_state = "fpmaint"

/area/maintenance/firstdeck/centralstarboard
	name = "Ground Floor East Maintenance"
	icon_state = "smaint"

/area/maintenance/firstdeck/centralport
	name = "Ground Floor West Maintenance"
	icon_state = "pmaint"

/area/hallway/primary/firstdeck/elevator
	name = "\improper Ground Floor Central Elevator Access"
	icon_state = "hallC"

/area/hallway/primary/firstdeck/north
	name = "\improper Ground Floor North Hallway"
	icon_state = "hallF"

/area/hallway/primary/firstdeck/fpcenter
	name = "\improper Ground Floor Northwest Central Hallway"
	icon_state = "hallC1"

/area/hallway/primary/firstdeck/fscenter
	name = "\improper Ground Floor Northeast Central Hallway"
	icon_state = "hallC2"

/area/hallway/primary/firstdeck/apcenter
	name = "\improper Ground Floor Southwest Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/firstdeck/ascenter
	name = "\improper Ground Floor Southeast Central Hallway"
	icon_state = "hallC4"

/area/hallway/primary/firstdeck/south
	name = "\improper Ground Floor South Hallway"
	icon_state = "hallA"

/area/hallway/primary/firstdeck/south/entrance
	name = "\improper Ground Floor South Entrance Hallway"

/area/hallway/primary/firstdeck/west
	name = "\improper Ground Floor West Hallway"
	icon_state = "hallP"

/area/hallway/primary/firstdeck/east
	name = "\improper Ground Floor East Hallway"
	icon_state = "hallS"

/area/hallway/primary/firstdeck/auxdockaft
	name = "\improper Ground Floor South Auxiliary Dock"
	icon_state = "docking_hallway"

/area/hallway/primary/firstdeck/auxdockfore
	name = "\improper Ground Floor North Auxiliary Dock"
	icon_state = "docking_hallway"

/area/hallway/secondary/escape/firstdeck/ep_port
	name = "\improper Large Escape Pod 2 West"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_starboard1
	name = "\improper Ground Floor Research Access Hallway"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_starboard2
	name = "\improper Large Escape Pod 2 East"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_aftport
	name = "\improper Escape Pods Southwest"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_aftstarboard
	name = "\improper Escape Pods Southeast"
	icon_state = "escape_pod"

/area/hangar
	name = "\improper Ground Floor Hangar"
	icon_state = "hangar"
	sound_env = LARGE_ENCLOSED
//	ambience = AMBIENCE_HANGAR

/area/hangar/one
	name = "\improper Hangar One"

/area/hangar/onecontrol
	name = "\improper Hangar One Control Room"
	icon_state = "hangarcontrol"

/area/hangar/two
	name = "\improper Hangar Two"

/area/hangar/twocontrol
	name = "\improper Hangar Two Control Room"
	icon_state = "hangarcontrol"

/area/hangar/three
	name = "\improper Hangar Three"

/area/hangar/threecontrol
	name = "\improper Hangar Three Control Room"
	icon_state = "hangarcontrol"

/area/security/checkpoint3
	name = "\improper Security - Auxiliary Checkpoint"
	icon_state = "security"

/area/medical/first_aid_station
	name = "\improper First-Aid Station"
	icon_state = "medbay2"

/area/medical/first_aid_station/firstdeck
	name = "\improper Ground Floor First-Aid Station"

/area/storage/emergency_storage
	area_flags = AREA_FLAG_RAD_SHIELDED
	name = "Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency_storage/firstdeck/aft_emergency
	name = "Ground Floor South Emergency Storage"

/area/storage/emergency_storage/firstdeck/ap_emergency
	name = "Ground Floor Southwest Emergency Storage"

/area/storage/emergency_storage/firstdeck/as_emergency
	name = "Ground Floor Southeast Emergency Storage"

/area/storage/emergency_storage/firstdeck/fore_emergency
	name = "Ground Floor North Emergency Storage"

/area/storage/emergency_storage/firstdeck/fp_emergency
	name = "Ground Floor Northwest Emergency Storage"

/area/storage/emergency_storage/firstdeck/fs_emergency
	name = "Ground Floor Northeast Emergency Storage"

/area/ai_monitored/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/ai_monitored/eva/pilot
	name = "Pilot EVA Storage"

/area/tcomm/
	icon_state = "tcomsatcham"
//	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/tcomm/entrance
	name = "\improper Telecomms Teleporter"
	icon_state = "tcomsatentrance"

/area/tcomm/tcomfoyer
	name = "\improper Telecomms Foyer"
	icon_state = "tcomsatfoyer"

/area/tcomm/chamber
	name = "\improper Telecomms Central Compartment"
	icon_state = "tcomsatcham"

/area/tcomm/tcomstorage
	name = "\improper Telecomms Storage"
	icon_state = "tcomsatstore"

/area/tcomm/computer
	name = "\improper Telecomms Control Room"
	icon_state = "tcomsatcomp"

/area/quartermaster/hallway
	name = "\improper Cargo Bay Hallway"
	icon_state = "quart"

/area/quartermaster/mininglockerroom
	name = "\improper Mining Locker Room"
	icon_state = "mining"

//First floor (Z-2)

/area/maintenance/emergencyeva
	name = "\improper Emergency EVA Maintenance"
	icon_state = "maint_eva"

/area/maintenance/robotics
	name = "Robotics Maintenance"
	icon_state = "maint_research"

/area/maintenance/research_medical
	name = "Research Medical Maintenance"
	icon_state = "maint_research"

/area/construction/seconddeck
	name = "\improper First Floor Engineering Construction Area"
	icon_state = "construction"

/area/construction/seconddeck/construction1
	name = "\improper First Floor Engineering Construction Area 1"

/area/construction/seconddeck/construction2
	name = "\improper Abandoned Locker Room"

/area/crew_quarters/heads/sc
	name = "\improper Command - Head Office"
	icon_state = "head_quarters"
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/sc/hop
	name = "\improper Command - HoP's Office"
	icon_state = "head_quarters"
//	holomap_color = HOLOMAP_AREACOLOR_COMMAND
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT

/area/crew_quarters/heads/sc/hor
	name = "\improper Research - RD's Office"
	icon_state = "head_quarters"
//	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT

/area/crew_quarters/heads/sc/chief
	name = "\improper Engineering - CE's Office"
	icon_state = "head_quarters"
//	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/crew_quarters/heads/sc/hos
	name = "\improper Security - HoS' Office"
	icon_state = "head_quarters"
//	holomap_color = HOLOMAP_AREACOLOR_SECURITY

/area/crew_quarters/heads/sc/cmo
	name = "\improper Medbay - CMO's Office"
	icon_state = "head_quarters"
//	holomap_color = HOLOMAP_AREACOLOR_MEDICAL
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT

/area/engineering/engineer_eva
	name = "\improper Engineering EVA"
	icon_state = "engine_eva"

/area/engineering/engi_restroom
	name = "\improper Engineering Restroom"
	icon_state = "toilet"
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/engineering/hallway/atmos_hallway
	name = "\improper Atmospherics Hallway"

/area/engineering/hallway/engineer_hallway
	name = "\improper Engineering Hallway"
	icon_state = "engineering_aft_hallway"

/area/hallway/primary/seconddeck/stairwell
	name = "\improper First Floor Central Stairwell Access"
	icon_state = "hallC"

/area/hallway/primary/seconddeck/north
	name = "\improper First Floor North Hallway"
	icon_state = "hallF"

/area/hallway/primary/seconddeck/fpcenter
	name = "\improper First Floor Northwest Central Hallway"
	icon_state = "hallC1"

/area/hallway/primary/seconddeck/fscenter
	name = "\improper First Floor Northeast Central Hallway"
	icon_state = "hallC2"

/area/hallway/primary/seconddeck/apcenter
	name = "\improper First Floor Southwest Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/seconddeck/ascenter
	name = "\improper First Floor Southeast Central Hallway"
	icon_state = "hallC4"

/area/hallway/primary/seconddeck/south
	name = "\improper First Floor South Hallway"
	icon_state = "hallA"

/area/hallway/primary/seconddeck/west
	name = "\improper First Floor West Hallway"
	icon_state = "hallP"

/area/hallway/primary/seconddeck/east
	name = "\improper First Floor East Hallway"
	icon_state = "hallS"

/area/hallway/primary/seconddeck/dockhallway
	name = "\improper Shuttle Dock Hallway"
	icon_state = "docking_hallway"

/area/hallway/secondary/seconddeck/research_medical
	name = "Research Medical Hallway"
	icon_state = "hallS"

/area/medical/foyer
	name = "\improper Medbay Foyer"
	icon_state = "medbay2"
//	music = 'sound/ambience/signal.ogg'

/area/medical/first_aid_station/seconddeck/
	name = "\improper First-Aid Station"

/area/medical/first_aid_station/seconddeck/west
	name = "\improper West First-Aid Station"

/area/medical/first_aid_station/seconddeck/north
	name = "\improper North First-Aid Station"

/area/medical/first_aid_station/seconddeck/south
	name = "\improper South First-Aid Station"

/area/medical/medical_lockerroom
	name = "\improper Medbay Locker Room"
	icon_state = "locker"

/area/medical/medical_restroom
	name = "\improper Medbay Restroom"
	icon_state = "medbay_restroom"
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/security/aid_station
	name = "\improper Security - Aid Station"
	icon_state = "security_aid_station"

/area/security/security_ses
	name = "\improper Security - Secondary Equipment Storage"
	icon_state = "security_equip_storage"

/area/security/security_restroom
	name = "\improper Security - Restroom"
	icon_state = "security_bathroom"
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/storage/emergency_storage/seconddeck/ap_emergency
	name = "First Floor Southwest Emergency Storage"

/area/storage/emergency_storage/seconddeck/as_emergency
	name = "First Floor Southeast Emergency Storage"

/area/storage/emergency_storage/seconddeck/central_emergency
	name = "First Floor Central Emergency Storage"

/area/storage/emergency_storage/seconddeck/fp_emergency
	name = "First Floor Northwest Emergency Storage"

/area/storage/emergency_storage/seconddeck/fs_emergency
	name = "First Floor Northeast Emergency Storage"

/area/storage/emergency_storage/seconddeck/port_emergency
	name = "First Floor West Emergency Storage"

/area/rnd/research_restroom_sc
	name = "\improper Research Restroom"
	icon_state = "research_restroom"
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/rnd/research_lockerroom
	name = "\improper Research - Locker Room"
	icon_state = "toxlab"

/area/rnd/toxins_launch
	name = "\improper Research - Toxins Launch Room"
	icon_state = "toxtest"

/area/research
	name = "\improper Research"
	icon_state = "research"

/area/research/hallway
	name = "\improper Research - Ground Floor Hallway"

/area/rnd/xenobiology
	name = "\improper Xenobiology"

/area/rnd/xenobiology/xenoflora_isolation
	name = "\improper Xenoflora Isolation"
	icon_state = "xeno_f_store"

/area/quartermaster/lockerroom
	name = "\improper Cargo Locker Room"
	icon_state = "quart"

//Deck Three (Z-3)

/area/ai
	name = "AI Core"
	icon_state = "ai_upload"

//	holomap_color = HOLOMAP_AREACOLOR_COMMAND
//	ambience = AMBIENCE_AI

/area/ai/ai_cyborg_station
	name = "\improper Cyborg Station"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED

/area/ai/ai_upload
	name = "\improper AI Upload Chamber"
	icon_state = "ai_upload"

/area/ai/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_foyer"
	sound_env = SMALL_ENCLOSED

/area/ai/ai_server_room
	name = "Messaging Server Room"
	icon_state = "ai_server"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/heads/sc/sd
	name = "\improper Command - Station Director's Office"
	icon_state = "captain"
	sound_env = MEDIUM_SOFTFLOOR
//	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/crew_quarters/heads/sc/hop/quarters
	name = "\improper Command - HoP's Quarters"
	icon_state = "head_quarters"

/area/crew_quarters/heads/sc/hor/quarters
	name = "\improper Research - RD's Quarters"
	icon_state = "research"

/area/crew_quarters/heads/sc/chief/quarters
	name = "\improper Engineering - CE's Quarters"
	icon_state = "engine"

/area/crew_quarters/heads/sc/hos/quarters
	name = "\improper Security - HoS' Quarters"
	icon_state = "security"

/area/crew_quarters/heads/sc/cmo/quarters
	name = "\improper Medbay - CMO's Quarters"
	icon_state = "medbay"

/area/crew_quarters/heads/sc/restroom
	name = "\improper Command - Restroom"
	icon_state = "toilet"

/area/crew_quarters/heads/sc/bs
	name = "\improper Command - Secretary Quarters"

/area/hallway/primary/thirddeck/central
	name = "\improper Second Floor Central Hallway"
	icon_state = "hallC"

/area/hallway/primary/thirddeck/west
	name = "\improper Second Floor West Hallway"
	icon_state = "hallP"

/area/hallway/primary/thirddeck/east
	name = "\improper Second Floor East Hallway"
	icon_state = "hallS"

/area/maintenance/thirddeck/aftstarboard
	name = "Second Floor Southeast Maintenance"
	icon_state = "asmaint"

/area/maintenance/thirddeck/aftport
	name = "Second Floor Southwest Maintenance"
	icon_state = "apmaint"

/area/maintenance/thirddeck/forestarboard
	name = "Third  Deck Northeast Maintenance"
	icon_state = "fsmaint"

/area/maintenance/thirddeck/foreport
	name = "Third  Deck Northwest Maintenance"
	icon_state = "fpmaint"

/area/maintenance/solars
	icon_state = "SolarcontrolA"
	sound_env = SMALL_ENCLOSED
//	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/maintenance/solars/aftportsolar
	name = "Solar Maintenance - Southwest"
	icon_state = "SolarcontrolP"

/area/maintenance/solars/aftstarboardsolar
	name = "Solar Maintenance - Southeast"
	icon_state = "SolarcontrolS"

/area/maintenance/solars/foreportsolar
	name = "Solar Maintenance - Northwest"
	icon_state = "SolarcontrolP"

/area/maintenance/solars/forestarboardsolar
	name = "Solar Maintenance - Northeast"
	icon_state = "SolarcontrolS"

/area/solar
	requires_power = 1
	always_unpowered = 1
	ambience = AMBIENCE_SPACE

/area/solar/aftportsolar
	name = "\improper Southwest Solar Array"
	icon_state = "panelsP"

/area/solar/foreportsolar
	name = "\improper Northwest Solar Array"
	icon_state = "panelsP"

/area/solar/aftstarboardsolar
	name = "\improper Southeast Solar Array"
	icon_state = "panelsS"

/area/solar/forestarboardsolar
	name = "\improper Northeast Solar Array"
	icon_state = "panelsS"

// Shuttles

//Shuttle One

/area/shuttle/shuttle_start
	name = "Shuttle One"
	icon_state = "shuttlered"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED

//Shuttle Two
/area/shuttle/shuttle_start_2
	name = "Shuttle Two"
	icon_state = "shuttlered"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED

//Small Escape Pods

/area/shuttle/escape_pod1
	name = "\improper Escape Pod One"
//	music = "music/escape.ogg"

/area/shuttle/escape_pod1/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod2
	name = "\improper Escape Pod Two"
//	music = "music/escape.ogg"

/area/shuttle/escape_pod2/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod3
	name = "\improper Escape Pod Three"
//	music = "music/escape.ogg"

/area/shuttle/escape_pod3/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod4
	name = "\improper Escape Pod Four"
//	music = "music/escape.ogg"

/area/shuttle/escape_pod4/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod5
	name = "\improper Escape Pod Five"
//	music = "music/escape.ogg"

/area/shuttle/escape_pod5/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod6
	name = "\improper Escape Pod Six"
//	music = "music/escape.ogg"

/area/shuttle/escape_pod6/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/escape_pod7
	name = "\improper Escape Pod Seven"
//	music = "music/escape.ogg"

/area/shuttle/escape_pod7/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/shuttle/escape_pod8
	name = "\improper Escape Pod Eight"
//	music = "music/escape.ogg"

/area/shuttle/escape_pod8/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

//Large Escape Pods

/area/shuttle/large_escape_pod1
	name = "\improper Large Escape Pod One"
//	music = "music/escape.ogg"

/area/shuttle/large_escape_pod1/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/large_escape_pod2
	name = "\improper Large Escape Pod Two"
//	music = "music/escape.ogg"

/area/shuttle/large_escape_pod2/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/shuttle/cryo_station
	name = "\improper Cryogenic Storage"
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless


// Misc
/area/security/nuke_storage
	name = "\improper Nuclear Material Storage"

/area/rnd/xenobiology/xenoflora
	name = "\improper Xenoflora Lab"

/area/quartermaster/storage
	name = "\improper Quartermaster Storage"

/area/security/brig
	name = "\improper Brig"

/area/security/security_equiptment_storage
	name = "\improper Security Equipment Storage"

/area/rnd/research_foyer
	name = "\improper Research Foyer"

/area/security/armoury
	name = "\improper Armoury"

/area/security/tactical
	name = "\improper Tactical Storage"

/area/rnd/test_area
	name = "\improper Research Test Area"

/area/security/prison
	name = "\improper Prison"

/area/security/security_lockerroom
	name = "\improper Security Locker Room"

/area/security/range
	name = "\improper Firing Range"

/area/storage/tech
	name = "\improper Technical Storage"

/area/medical/genetics_cloning
	name = "\improper Cloning Lab"

/area/medical/ward
	name = "\improper Medical Ward"

/area/medical/morgue
	name = "\improper Morgue"

/area/crew_quarters/locker/locker_toilet
	name = "\improper Toilets"

/area/crew_quarters/bar
	name = "\improper Bar"

/area/security/main
	name = "\improper Security"

/area/security/warden
	name = "\improper Warden Office"

/area/engineering/atmos
	name = "\improper Atmospherics"

/area/security/evidence_storage
	name = "\improper Evidence Storage"

/area/security/security_cell_hallway
	name = "\improper Brig Hallway"

/area/security/security_processing
	name = "\improper Processing"

/area/maintenance/security_starboard
	name = "\improper East Security"

/area/maintenance/security_port
	name = "\improper West Security"

/area/lawoffice
	name = "\improper Legal Office"

/area/security/lobby
	name = "\improper Security Lobby"

/area/security/riot_control
	name = "\improper Riot Control"

/area/security/detectives_office
	name = "\improper Detective Office"

/area/hallway/secondary/eva_hallway
	name = "\improper EVA Hallway"

/area/maintenance/engineering
	name = "\improper Engineering Maintenance"

/area/maintenance/research
	name = "\improper Research Maintenance"

/area/storage/auxillary
	name = "\improper Auxillary Storage"

/area/janitor
	name = "\improper Custodial Office"


/area/engineering/atmos/monitoring
	name = "\improper Atmospherics Monitoring"

/area/crew_quarters/locker
	name = "\improper Locker Room"

/area/maintenance/research
	name = "\improper Research Maintenance"

/area/engineering/storage
	name = "\improper Engineering Storage"

/area/rnd/storage
	name = "\improper Research Storage"

/area/engineering/drone_fabrication
	name = "\improper Drone Fabrication"

/area/medical/medbay_emt_bay
	name = "\improper EMT Bay"

/area/quartermaster/qm
	name = "\improper Quartermaster Office"

/area/quartermaster/foyer
	name = "\improper Quartermaster Foyer"

/area/quartermaster/delivery
	name = "\improper Delivery Office"

/area/medical/biostorage
	name = "\improper Biological Storage"

/area/medical/medbay_primary_storage
	name = "\improper Primary Medical Storage"

/area/medical/chemistry
	name = "\improper Chemistry"

/area/medical/reception
	name = "\improper Medical Reception"

/area/medical/exam_room
	name = "\improper Exam Room"

/area/medical/medbay
	name = "\improper Medbay"

/area/quartermaster/warehouse
	name = "\improper Warehouse"

/area/maintenance/cargo
	name = "\improper Cargo Maintenance"

/area/maintenance/disposal
	name = "\improper Disposals"

/area/quartermaster/office
	name = "\improper Quartermaster's Office"

/area/medical/psych
	name = "\improper Psychiatrist's Office"

/area/medical/cryo
	name = "\improper Cryogenics"

/area/medical/sleeper
	name = "\improper Sleepers"

/area/engineering/engine_smes
	name = "\improper SMES Chamber"

/area/ai_monitored/emergency/eva
	name = "\improper EVA Storage"

/area/maintenance/medbay_fore
	name = "\improper North Medbay"

/area/maintenance/medbay
	name = "\improper Medbay Maintenance"

/area/maintenance/bar
	name = "\improper Bar Maintenance"

/area/maintenance/library
	name = "\improper Library Maintenance"

/area/engineering/engine_waste
	name = "\improper Engine Waste Handling"

/area/rnd/mixing
	name = "\improper Toxins Mixing"

/area/rnd/workshop
	name = "\improper Research Workshop"

/area/engineering/locker_room
	name = "\improper Engineering Locker Room"

/area/engineering/break_room
	name = "\improper Engineering Break Room"

/area/engineering/workshop
	name = "\improper Engineering Workshop"

/area/server
	name = "\improper Server"

/area/rnd/misc_lab
	name = "\improper Miscellaneous Testing"

/area/assembly/robotics
	name = "\improper Robotics"

/area/rnd/lab
	name = "\improper Research and Development"

/area/engineering/engine_room
	name = "\improper Engine Room"

/area/engineering/foyer
	name = "\improper Engineering Foyer"

/area/teleporter
	name = "\improper Teleporter"

/area/maintenance/central
	name = "\improper Central Maintenance"

/area/medical/virology
	name = "\improper Virology"

/area/assembly/chargebay
	name = "\improper Recharging Bay"

/area/engineering/engine_airlock
	name = "\improper Engine Airlock"

/area/maintenance/apmaint
	name = "\improper AP Maintenance"

/area/engineering/engine_monitoring
	name = "\improper Engine MOnitoring"

/area/medical/medbay2
	name = "\improper Medbay 2"

/area/medical/genetics
	name = "\improper Genetics"

/area/crew_quarters/vistor_room_1
	name = "\improper Visitor Room 1"

/area/crew_quarters/vistor_room_2
	name = "\improper Visitor Room 2"

/area/crew_quarters/kitchen
	name = "\improper Kitchen"

/area/crew_quarters/kitchen/coldroom
	name = "\improper Kitchen Cold Room"

/area/medical/patient_wing
	name = "\improper Patient Wing"

/area/medical/patient_a
	name = "\improper Patient Room A"

/area/medical/patient_b
	name = "\improper Patient Room B"

/area/crew_quarters/cafeteria
	name = "\improper Cafeteria"

/area/medical/surgery_storage
	name = "\improper Surgical Storage"

/area/medical/surgery2
	name = "\improper Secondary Surgery"

/area/medical/surgery
	name = "\improper Primary Surgery"

/area/medical/surgeryobs
	name = "\improper Surgery Observation"

/area/maintenance/locker
	name = "\improper Locker Room Maintenance"

/area/maintenance/chapel
	name = "\improper Chapel"

/area/hydroponics
	name = "\improper Hydroponics"

/area/holodeck/alphadeck
	name = "\improper Holodeck"

/area/chapel/main
	name = "\improper Prayer Room"

/area/library
	name = "\improper Library"

/area/library/office
	name = "\improper Library - Curator's Office"

/area/chapel/office
	name = "\improper Chapel Office"

/area/hallway/secondary/docking_hallway2
	name = "\improper Secondary Docking Hallway"

/area/storage/primary
	name = "\improper Primary Tool Storage"

/area/security/checkpoint2
	name = "\improper Secondary Security Checkpoint"

/area/hallway/secondary/entry/docking_lounge
	name = "\improper Docking Lounge"

/area/bridge
	name = "\improper Bridge"

/area/bridge/meeting_room
	name = "\improper Meeting Room"

/area/hallway/secondary/entry/dock_one
	name = "\improper Dock One"

/area/hallway/secondary/entry/dock_two
	name = "\improper Dock Two"

/area/hallway/secondary/entry/dock_three
	name = "\improper Dock Three"

/area/maintenance/substation/civilian
	name = "\improper Civilian Substation"

/area/maintenance/substation/command
	name = "\improper Command Substation"

/area/maintenance/substation/research
	name = "\improper Research Substation"

/area/maintenance/substation/cargo
	name = "\improper Cargo Substation"

/area/maintenance/substation/medical
	name = "\improper Medical Substation"

/area/maintenance/substation/engineering
	name = "\improper Engineering Substration"

/area/maintenance/substation/firstdeck
	name = "Ground Floor Utility Access"

/area/maintenance/substation/firstdeck/cargo
	name = "Ground Floor Cargo Substation"

/area/maintenance/substation/atmospherics
	name = "Atmospherics Substation"

/area/maintenance/substation/central // n/a
	name = "Central Substation"

/area/maintenance/substation/security
	name = "\improper Security Substation"

/area/giftshop
	name = "\improper Gift Shop"

/area/giftshop/storage
	name = "\improper Gift Shop Storage"

/area/rooflounge
	name = "\improper Rooftop Lounge"

/area/roofgarden
	name = "\improper Rooftop Garden"

/area/balcony
	name = "balcony area master"

/area/balcony/south
	name ="\improper South Balcony"