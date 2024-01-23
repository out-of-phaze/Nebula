// We need to inherit from /area/turbolift due to vars/logic on the base type.
/area/turbolift/crux
	name             = "Turbolift"
	dynamic_lighting = TRUE
	area_flags       = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

// Elevator areas.
/area/turbolift/crux/port_deck_one
	name = "lift (ground floor)"
	lift_floor_label = "Ground Floor"
	lift_floor_name = "Ground Floor"
	lift_announce_str = "Arriving at Ground Floor: Main Hangars. Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/crux/port_deck_two
	name = "lift (first floor)"
	lift_floor_label = "First Floor"
	lift_floor_name = "First Floor"
	lift_announce_str = "Arriving at First Floor: Operations. Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/crux/starboard_deck_one
	name = "lift (ground floor)"
	lift_floor_label = "Ground Floor"
	lift_floor_name = "Ground Floor"
	lift_announce_str = "Arriving at Ground Floor: Main Hangars. Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/crux/starboard_deck_two
	name = "lift (first floor)"
	lift_floor_label = "First Floor"
	lift_floor_name = "First Floor"
	lift_announce_str = "Arriving at First Floor: Operations. Engineering. Cargo. Medbay. Research. Security. Crew Facilities, Shuttle Docks. Cryogenic Storage."

/area/turbolift/crux/center_deck_one
	name = "lift (ground floor)"
	lift_floor_label = "Ground Floor"
	lift_floor_name = "Ground Floor"
	lift_announce_str = "Arriving at Ground Floor: Main Hangars. Cargo Delivery. Telecommunications. Auxiliary Shuttle Docks. Escape Pods."
	base_turf = /turf/simulated/floor

/area/turbolift/crux/center_deck_two
	name = "lift (first floor)"
	lift_floor_label = "First Floor"
	lift_floor_name = "First Floor"
	lift_announce_str = "Arriving at First Floor: Operations. Engineering. Cargo. Medbay. Research. Security. Crew Facilities Shuttle Docks. Cryogenic Storage."

/area/turbolift/crux/center_deck_three
	name = "lift (second floor)"
	lift_floor_label = "Second Floor"
	lift_floor_name = "Second Floor"
	lift_announce_str = "Arriving at Second Floor: Command. Bridge. Meeting Room. Command Quarters. AI Core. Solars."

/area/turbolift/crux/cargo_deck_one
	name = "lift (ground floor)"
	lift_floor_label = "Ground Floor"
	lift_floor_name = "Ground Floor"
	lift_announce_str = "Arriving at Cargo Delivery."
	base_turf = /turf/simulated/floor

/area/turbolift/crux/cargo_deck_two
	name = "lift (first floor)"
	lift_floor_label = "First Floor"
	lift_floor_name = "First Floor"
	lift_announce_str = "Arriving at Cargo."