/area/crux/shuttle
	requires_power = 0
	sound_env = SMALL_ENCLOSED
	base_turf = /turf/space
	area_flags = AREA_FLAG_SHUTTLE | AREA_FLAG_RAD_SHIELDED
	holomap_color = HOLOMAP_AREACOLOR_CREW

//Shuttle One
/area/crux/shuttle/shuttle_start
	name = "Shuttle One"
	icon_state = "shuttlered"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED

//Shuttle Two
/area/crux/shuttle/shuttle_start_2
	name = "Shuttle Two"
	icon_state = "shuttlered"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED

//Small Escape Pods

/area/crux/shuttle/escape_pod1
	name = "\improper Escape Pod One"
//	music = "music/escape.ogg"

/area/crux/shuttle/escape_pod1/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/crux/shuttle/escape_pod2
	name = "\improper Escape Pod Two"
//	music = "music/escape.ogg"

/area/crux/shuttle/escape_pod2/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/crux/shuttle/escape_pod7
	name = "\improper Escape Pod Seven"
//	music = "music/escape.ogg"

/area/crux/shuttle/escape_pod7/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

/area/crux/shuttle/escape_pod8
	name = "\improper Escape Pod Eight"
//	music = "music/escape.ogg"

/area/crux/shuttle/escape_pod8/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced/airless

//Large Escape Pods

/area/crux/shuttle/large_escape_pod1
	name = "\improper Large Escape Pod One"
//	music = "music/escape.ogg"

/area/crux/shuttle/large_escape_pod1/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless

/area/crux/shuttle/large_escape_pod2
	name = "\improper Large Escape Pod Two"
//	music = "music/escape.ogg"

/area/crux/shuttle/large_escape_pod2/station
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/airless
