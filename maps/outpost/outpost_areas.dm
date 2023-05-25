/area/planetary_outpost
	name = "\improper Planetary Outpost"
	holomap_color = HOLOMAP_AREACOLOR_CREW

/area/planetary_outpost/maintenance
	name = "\improper Planetary Outpost East Maintenance"
	holomap_color = HOLOMAP_AREACOLOR_MAINTENANCE

/area/planetary_outpost/maintenance/west
	name = "\improper Planetary Outpost West Maintenance"

/area/planetary_outpost/medical
	name = "\improper Planetary Outpost Medbay"
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

/area/planetary_outpost/research
	name = "\improper Planetary Outpost Lab"
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/planetary_outpost/power
	name = "\improper Planetary Outpost Power Shed"
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/planetary_outpost/mess
	name = "\improper Planetary Outpost Mess Hall"

/area/planetary_outpost/bathroom
	name = "\improper Planetary Outpost East Bathroom"

/area/planetary_outpost/shower
	name = "\improper Planetary Outpost Shower"

/area/planetary_outpost/storage
	name = "\improper Planetary Outpost Storeroom"

/area/planetary_outpost/refinery
	name = "\improper Planetary Outpost Refinery"

/area/turbolift/space_elevator
	name = "\improper Planetary Outpost Space Elevator"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = TRUE
	sound_env = STANDARD_STATION
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	arrival_sound = null
	lift_announce_str = null
	holomap_color = HOLOMAP_AREACOLOR_LIFTS