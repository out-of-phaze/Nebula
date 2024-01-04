#define AMBIENCE_SPACE list('sound/ambience/ambispace1.ogg','sound/ambience/ambispace2.ogg','sound/ambience/ambispace3.ogg','sound/ambience/ambispace4.ogg','sound/ambience/ambispace5.ogg')

/datum/map/crux
	apc_test_exempt_areas = list(
		/area/surface   = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space     = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/turbolift = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle   = NO_SCRUBBER|NO_VENT|NO_APC
	)


//Planetside

/area
/area/surface
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/surface/level_one

/area/surface/level_two

/area/turbolift
	name = "\improper Turbolift"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

// Elevator areas.
/area/turbolift/port_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars.Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/port_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Operations Deck: Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/starboard_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars.Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/starboard_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Operations Deck: Engineering. Cargo. Medbay. Research. Security. Crew Facilities, Shuttle Docks. Cryogenic Storage."

/area/turbolift/center_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Hangar Deck: Main Hangars .Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/center_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Operations Deck: Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/center_deck_three
	name = "lift (third deck)"
	lift_floor_label = "Deck 3"
	lift_floor_name = "Command Deck"
	lift_announce_str = "Arriving at Command Deck: Bridge. Meeting Room. Command Quarters. AI Core. Solars."

/area/turbolift/cargo_deck_one
	name = "lift (first deck)"
	lift_floor_label = "Deck 1"
	lift_floor_name = "Hangar Deck"
	lift_announce_str = "Arriving at Cargo Delivery."
	base_turf = /turf/simulated/floor

/area/turbolift/cargo_deck_two
	name = "lift (second deck)"
	lift_floor_label = "Deck 2"
	lift_floor_name = "Operations Deck"
	lift_announce_str = "Arriving at Cargo."

//Deck One (Z-1)

/area/engineering/auxiliary_engineering
	name = "\improper Auxiliary Engineering Station"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/firstdeck/gym
	name = "\improper Station Gym"
	icon_state = "fitness"

/area/construction/firstdeck/
	name = "\improper Engineering Construction Area"
	icon_state = "construction"

/area/construction/firstdeck/construction1
	name = "\improper First Deck Engineering Construction Area 1"

/area/construction/firstdeck/construction2
	name = "\improper First Deck Engineering Construction Area 2"

/area/construction/firstdeck/construction3
	name = "\improper First Deck Engineering Construction Area 3"

/area/construction/firstdeck/construction4
	name = "\improper First Deck Engineering Construction Area 4"

/area/construction/firstdeck/construction5
	name = "\improper First Deck Engineering Construction Area 5"

/area/crew_quarters/toilet/firstdeck
	name = "\improper First Deck Restroom"

/area/maintenance/firstdeck
	name = "First Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/firstdeck/aftstarboard
	name = "First Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/firstdeck/aftport
	name = "First Deck Aft Port Maintenance"
	icon_state = "apmaint"

/area/maintenance/firstdeck/forestarboard
	name = "First Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/firstdeck/foreport
	name = "First Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/firstdeck/centralstarboard
	name = "First Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/firstdeck/centralport
	name = "First Deck Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/substation/firstdeck
	name = "First Deck Utility Access"

/area/maintenance/substation/firstdeck/cargo
	name = "First Deck Cargo Substation"

/area/hallway/primary/firstdeck/elevator
	name = "\improper First Deck Central Elevator Access"
	icon_state = "hallC"

/area/hallway/primary/firstdeck/fore
	name = "\improper First Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/firstdeck/fpcenter
	name = "\improper First Deck Fore Port Central Hallway"
	icon_state = "hallC1"

/area/hallway/primary/firstdeck/fscenter
	name = "\improper First Deck Fore Starboard Central Hallway"
	icon_state = "hallC2"

/area/hallway/primary/firstdeck/apcenter
	name = "\improper First Deck Aft Port Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/firstdeck/ascenter
	name = "\improper First Deck Aft Starboard Central Hallway"
	icon_state = "hallC4"

/area/hallway/primary/firstdeck/aft
	name = "\improper First Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/firstdeck/port
	name = "\improper First Deck Port Hallway"
	icon_state = "hallP"

/area/hallway/primary/firstdeck/starboard
	name = "\improper First Deck Starboard Hallway"
	icon_state = "hallS"

/area/hallway/primary/firstdeck/auxdockaft
	name = "\improper First Deck Aft Auxiliary Dock"
	icon_state = "docking_hallway"

/area/hallway/primary/firstdeck/auxdockfore
	name = "\improper First Deck Fore Auxiliary Dock"
	icon_state = "docking_hallway"

/area/hallway/secondary/escape/firstdeck/ep_port
	name = "\improper Large Escape Pod 2 Port"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_starboard1
	name = "\improper First Deck Research Access Hallway"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_starboard2
	name = "\improper Large Escape Pod 2 Starboard"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_aftport
	name = "\improper Escape Pods Aft Port"
	icon_state = "escape_pod"

/area/hallway/secondary/escape/firstdeck/ep_aftstarboard
	name = "\improper Escape Pods Aft Starboard"
	icon_state = "escape_pod"

/area/hangar
	name = "\improper First Deck Hangar"
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

/area/medical/first_aid_station/firstdeck/
	name = "\improper First Deck First-Aid Station"

/area/storage/emergency_storage/
	area_flags = AREA_FLAG_RAD_SHIELDED
	name = "Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency_storage/firstdeck/aft_emergency
	name = "First Deck Aft Emergency Storage"

/area/storage/emergency_storage/firstdeck/ap_emergency
	name = "First Deck Aft Port Emergency Storage"

/area/storage/emergency_storage/firstdeck/as_emergency
	name = "First Deck Aft Starboard Emergency Storage"

/area/storage/emergency_storage/firstdeck/fore_emergency
	name = "First Deck Fore Emergency Storage"

/area/storage/emergency_storage/firstdeck/fp_emergency
	name = "First Deck Fore Port Emergency Storage"

/area/storage/emergency_storage/firstdeck/fs_emergency
	name = "First Deck Fore Starboard Emergency Storage"

/area/ai_monitored/storage/eva/pilot
	name = "Pilot EVA Storage"
	icon_state = "eva"

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

//Deck Two (Z-2)

/area/maintenance/substation/atmospherics
	name = "Atmospherics Substation"

/area/maintenance/emergencyeva
	name = "\improper Emergency EVA Maintenance"
	icon_state = "maint_eva"

/area/maintenance/substation/central // n/a
	name = "Central Substation"

/area/maintenance/robotics
	name = "Robotics Maintenance"
	icon_state = "maint_research"

/area/maintenance/research_medical
	name = "Research Medical Maintenance"
	icon_state = "maint_research"

/area/construction/seconddeck/
	name = "\improper Second Deck Engineering Construction Area"
	icon_state = "construction"

/area/construction/seconddeck/construction1
	name = "\improper Second Deck Engineering Construction Area 1"

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
	name = "\improper Second Deck Central Stairwell Access"
	icon_state = "hallC"

/area/hallway/primary/seconddeck/fore
	name = "\improper Second Deck Fore Hallway"
	icon_state = "hallF"

/area/hallway/primary/seconddeck/fpcenter
	name = "\improper Second Deck Fore Port Central Hallway"
	icon_state = "hallC1"

/area/hallway/primary/seconddeck/fscenter
	name = "\improper Second Deck Fore Starboard Central Hallway"
	icon_state = "hallC2"

/area/hallway/primary/seconddeck/apcenter
	name = "\improper Second Deck Aft Port Central Hallway"
	icon_state = "hallC3"

/area/hallway/primary/seconddeck/ascenter
	name = "\improper Second Deck Aft Starboard Central Hallway"
	icon_state = "hallC4"

/area/hallway/primary/seconddeck/aft
	name = "\improper Second Deck Aft Hallway"
	icon_state = "hallA"

/area/hallway/primary/seconddeck/port
	name = "\improper Second Deck Port Hallway"
	icon_state = "hallP"

/area/hallway/primary/seconddeck/starboard
	name = "\improper Second Deck Starboard Hallway"
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

/area/medical/first_aid_station/seconddeck/port
	name = "\improper Port First-Aid Station"

/area/medical/first_aid_station/seconddeck/fore
	name = "\improper Fore First-Aid Station"

/area/medical/first_aid_station/seconddeck/aft
	name = "\improper Aft First-Aid Station"

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
	name = "Second Deck Aft Port Emergency Storage"

/area/storage/emergency_storage/seconddeck/as_emergency
	name = "Second Deck Aft Starboard Emergency Storage"

/area/storage/emergency_storage/seconddeck/central_emergency
	name = "Second Deck Central Emergency Storage"

/area/storage/emergency_storage/seconddeck/fp_emergency
	name = "Second Deck Fore Port Emergency Storage"

/area/storage/emergency_storage/seconddeck/fs_emergency
	name = "Second Deck Fore Starboard Emergency Storage"

/area/storage/emergency_storage/seconddeck/port_emergency
	name = "Second Deck Port Emergency Storage"

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

/area/rnd/research/firstdeck/hallway
	name = "\improper Research - First Deck Hallway"
	icon_state = "research"

/area/rnd/xenobiology/xenoflora_isolation
	name = "\improper Xenoflora Isolation"
	icon_state = "xeno_f_store"

/area/quartermaster/lockerroom
	name = "\improper Cargo Locker Room"
	icon_state = "quart"

//Deck Three (Z-3)

/area/ai
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
	name = "\improper Third Deck Port Hallway"
	icon_state = "hallC"

/area/hallway/primary/thirddeck/port
	name = "\improper Third Deck Port Hallway"
	icon_state = "hallP"

/area/hallway/primary/thirddeck/starboard
	name = "\improper Third Deck Starboard Hallway"
	icon_state = "hallS"

/area/maintenance/thirddeck/aftstarboard
	name = "Third Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/thirddeck/aftport
	name = "Third Deck Aft Port Maintenance"
	icon_state = "apmaint"

/area/maintenance/thirddeck/forestarboard
	name = "Third  Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/thirddeck/foreport
	name = "Third  Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/solars
	icon_state = "SolarcontrolA"
	sound_env = SMALL_ENCLOSED
//	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/maintenance/solars/aftportsolar
	name = "Solar Maintenance - Aft Port"
	icon_state = "SolarcontrolP"

/area/maintenance/solars/aftstarboardsolar
	name = "Solar Maintenance - Aft Starboard"
	icon_state = "SolarcontrolS"

/area/maintenance/solars/foreportsolar
	name = "Solar Maintenance - Fore Port"
	icon_state = "SolarcontrolP"

/area/maintenance/solars/forestarboardsolar
	name = "Solar Maintenance - Fore Starboard"
	icon_state = "SolarcontrolS"

/area/solar
	requires_power = 1
	always_unpowered = 1
	ambience = AMBIENCE_SPACE

/area/solar/aftportsolar
	name = "\improper Aft Port Solar Array"
	icon_state = "panelsP"

/area/solar/foreportsolar
	name = "\improper Fore Port Solar Array"
	icon_state = "panelsP"

/area/solar/aftstarboardsolar
	name = "\improper Aft Starboard Solar Array"
	icon_state = "panelsS"

/area/solar/forestarboardsolar
	name = "\improper Fore Starboard Solar Array"
	icon_state = "panelsS"

/area/thirddeck/roof
	name = "\improper Third Deck Plating"
	dynamic_lighting = 0
	ambience = AMBIENCE_SPACE
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT

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
	name = "\improper Starboard Security"

/area/maintenance/security_port
	name = "\improper Port Security"

/area/maintenance/substation/security
	name = "\improper Security Substation"

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

/area/maintenance/substation/engineering
	name = "\improper Engineering Substation"

/area/storage/auxillary
	name = "\improper Auxillary Storage"

/area/janitor
	name = "\improper Custodial Office"

/area/maintenance/substation/engineering
	name = "\improper Engineering Substration"

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

/area/maintenance/substation/medical
	name = "\improper Medical Substation"

/area/maintenance/substation/cargo
	name = "\improper Cargo Substation"

/area/maintenance/substation/medical
	name = "\improper Medical Substation"

/area/engineering/engine_smes
	name = "\improper SMES Chamber"

/area/ai_monitored/storage/emergency/eva
	name = "\improper EVA Storage"

/area/maintenance/medbay_fore
	name = "\improper Fore Medbay"

/area/maintenance/medbay
	name = "\improper Medbay Maintenance"

/area/maintenance/bar
	name = "\improper Bar Maintenance"

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

/area/maintenance/substation/research
	name = "\improper Research Substation"

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

/area/maintenance/substation/civilian
	name = "\improper Civilian Substation"

/area/maintenance/substation/command
	name = "\improper Command Substation"

/area/holodeck/alphadeck
	name = "\improper Holodeck"

/area/chapel/main
	name = "\improper Chapel"

/area/library
	name = "\improper Library"

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

/area/hallway/secondary/entry/D2/arrivals
	name = "\improper Deck Two Arrivals"

/area/bridge
	name = "\improper Bridge"

/area/bridge/meeting_room
	name = "\improper Meeting Room"

/area/hallway/secondary/entry/D1
	name = "\improper Deck One Entry"

/area/hallway/secondary/entry/D2
	name = "\improper Deck Two Entry"

/area/hallway/secondary/entry/D3
	name = "\improper Deck Three Entry"
