/area/crux/maintenance
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance
	forced_ambience = list('sound/ambience/maintambience.ogg')
	req_access = list(access_maint_tunnels)
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS

/area/crux/maintenance/firstdeck
	name = "Ground Floor Maintenance"
	icon_state = "maintcentral"

/area/crux/maintenance/firstdeck/aftstarboard
	name = "Ground Floor Southeast Maintenance"
	icon_state = "asmaint"

/area/crux/maintenance/firstdeck/aftport
	name = "Ground Floor Southwest Maintenance"
	icon_state = "apmaint"

/area/crux/maintenance/firstdeck/forestarboard
	name = "Ground Floor Northeast Maintenance"
	icon_state = "fsmaint"

/area/crux/maintenance/firstdeck/foreport
	name = "Ground Floor Northwest Maintenance"
	icon_state = "fpmaint"

/area/crux/maintenance/firstdeck/centralstarboard
	name = "Ground Floor East Maintenance"
	icon_state = "smaint"

/area/crux/maintenance/firstdeck/centralport
	name = "Ground Floor West Maintenance"
	icon_state = "pmaint"

/area/crux/maintenance
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/crux/maintenance/thirddeck/aftstarboard
	name = "Second Floor Southeast Maintenance"
	icon_state = "asmaint"

/area/crux/maintenance/thirddeck/aftport
	name = "Second Floor Southwest Maintenance"
	icon_state = "apmaint"

/area/crux/maintenance/thirddeck/forestarboard
	name = "Third  Deck Northeast Maintenance"
	icon_state = "fsmaint"

/area/crux/maintenance/thirddeck/foreport
	name = "Third  Deck Northwest Maintenance"
	icon_state = "fpmaint"

/area/crux/maintenance/solars
	icon_state = "SolarcontrolA"
	sound_env = SMALL_ENCLOSED

/area/crux/maintenance/solars/aftportsolar
	name = "Solar Maintenance - Southwest"
	icon_state = "SolarcontrolP"

/area/crux/maintenance/solars/aftstarboardsolar
	name = "Solar Maintenance - Southeast"
	icon_state = "SolarcontrolS"

/area/crux/maintenance/solars/foreportsolar
	name = "Solar Maintenance - Northwest"
	icon_state = "SolarcontrolP"

/area/crux/maintenance/solars/forestarboardsolar
	name = "Solar Maintenance - Northeast"
	icon_state = "SolarcontrolS"

/area/crux/maintenance/security_starboard
	name = "\improper East Security"

/area/crux/hallway/secondary/eva_hallway
	name = "\improper EVA Hallway"

/area/crux/maintenance/engineering
	name = "\improper Engineering Maintenance"

/area/crux/maintenance/research
	name = "\improper Research Maintenance"
	req_access = list(access_maintenance)
	holomap_color = HOLOMAP_AREACOLOR_MAINTENANCE

/area/crux/maintenance/research
	name = "\improper Research Maintenance"

/area/crux/maintenance/emergencyeva
	name = "\improper Emergency EVA Maintenance"
	icon_state = "maint_eva"

/area/crux/maintenance/robotics
	name = "Robotics Maintenance"
	icon_state = "maint_research"

/area/crux/maintenance/research_medical
	name = "Research Medical Maintenance"
	icon_state = "maint_research"

/area/crux/maintenance/cargo
	name = "\improper Cargo Maintenance"

/area/crux/maintenance/disposal
	name = "\improper Disposals"

/area/crux/maintenance/medbay_fore
	name = "\improper North Medbay"

/area/crux/maintenance/medbay
	name = "\improper Medbay Maintenance"

/area/crux/maintenance/bar
	name = "\improper Bar Maintenance"

/area/crux/maintenance/library
	name = "\improper Library Maintenance"

/area/crux/maintenance/apmaint
	name = "\improper AP Maintenance"

/area/crux/maintenance/central
	name = "\improper Central Maintenance"

/area/crux/maintenance/substation/command
	name = "\improper Command Substation"

/area/crux/maintenance/substation/research
	name = "\improper Research Substation"

/area/crux/maintenance/substation/cargo
	name = "\improper Cargo Substation"

/area/crux/maintenance/substation/medical
	name = "\improper Medical Substation"

/area/crux/maintenance/substation/engineering
	name = "\improper Engineering Substration"

/area/crux/maintenance/substation/firstdeck
	name = "Ground Floor Utility Access"

/area/crux/maintenance/substation/firstdeck/cargo
	name = "Ground Floor Cargo Substation"

/area/crux/maintenance/substation/atmospherics
	name = "Atmospherics Substation"

/area/crux/maintenance/substation/central
	name = "Central Substation"

/area/crux/maintenance/substation/security
	name = "\improper Security Substation"
