/obj/machinery/cryopod/robot/door
	//This inherits from the robot cryo, so synths can be properly cryo'd.  If a non-synth enters and is cryo'd, ..() is called and it'll still work.
	name = "Airlock of Wonders"
	desc = "An airlock that isn't an airlock, and shouldn't exist.  Yell at a coder/mapper."
	icon = 'icons/obj/doors/Doorint.dmi'
	icon_state = "door_open"
	base_icon_state = "door_open"
	occupied_icon_state = "door_closed"
	// on_enter_visible_message = "steps into the"

	time_till_despawn = 600 //1 minute. We want to be much faster then normal cryo, since waiting in an elevator for half an hour is a special kind of hell.

	allow_occupant_types = list(/mob/living/silicon/robot,/mob/living/carbon/human)
	disallow_occupant_types = list(/mob/living/silicon/robot/drone)

/obj/machinery/cryopod/robot/door/dorms
	name = "Residential District Elevator"
	desc = "A small elevator that goes down to the deeper section of the colony."
	on_store_message = "has departed for the residential district."
	on_store_name = "Residential Oversight"
	on_enter_occupant_message = "The elevator door closes slowly, ready to bring you down to the residential district."
	// on_store_visible_message_1 = "makes a ding as it moves"
	// on_store_visible_message_2 = "to the residential district."

/obj/machinery/cryopod/robot/door/travel
	name = "Passenger Elevator"
	desc = "A small elevator that goes down to the passenger section of the vessel."
	on_store_message = "is slated to depart from the colony."
	on_store_name = "Travel Oversight"
	on_enter_occupant_message = "The elevator door closes slowly, ready to bring you down to the hell that is economy class travel."
	// on_store_visible_message_1 = "makes a ding as it moves"
	// on_store_visible_message_2 = "to the passenger deck."

/obj/machinery/cryopod/robot/door/gateway
	name = "Gateway"
	desc = "The gateway you might've came in from.  You could leave the colony easily using this."
	icon = 'icons/obj/machines/gateway.dmi'
	icon_state = "offcenter"
	base_icon_state = "offcenter"
	occupied_icon_state = "oncenter"
	on_store_message = "has departed from the colony."
	on_store_name = "Travel Oversight"
	on_enter_occupant_message = "The gateway activates, and you step into the swirling portal."
	// on_store_visible_message_1 = "'s portal disappears just after"
	// on_store_visible_message_2 = "finishes walking across it."

	time_till_despawn = 60 //1 second, because gateway.

// Tram departure cryo doors that turn into ordinary airlock doors at round end
/obj/machinery/cryopod/robot/door/tram
	name = "\improper Tram Station"
	// icon = 'icons/obj/doors/Doorextglass.dmi' // FUCK YOU
	icon_state = "door_closed"
	atmos_canpass = CANPASS_NEVER
	base_icon_state = "door_closed"
	occupied_icon_state = "door_locked"
	desc = "The tram station you might've came in from.  You could leave the base easily using this."
	on_store_message = "has departed on the tram."
	on_store_name = "Travel Oversight"
	on_enter_occupant_message = "The tram arrives at the platform; you step inside and take a seat."
	// on_store_visible_message_1 = "'s speakers chime, anouncing a tram has arrived to take"
	// on_store_visible_message_2 = "to the colony"
	time_till_despawn = 10 SECONDS
	// spawnpoint_type = /datum/spawnpoint/tram

/obj/machinery/cryopod/robot/door/tram/Process()
	if(SSevac.evacuation_controller.is_evacuating())
		// Transform into a door!  But first despawn anyone inside
		time_till_despawn = 0
		..()
		var/turf/T = get_turf(src)
		var/obj/machinery/door/airlock/external/glass/door = new(T)
		door.req_access = null
		qdel(src)
	// Otherwise just operate normally
	return ..()

/obj/machinery/cryopod/robot/door/tram/Bumped(var/atom/movable/AM)
	if(!ishuman(AM))
		return

	var/mob/living/carbon/human/user = AM

	var/choice = alert(user, "Do you want to depart via the tram? Your character will leave the round.","Departure","No","Yes")
	if(user && Adjacent(user) && choice == "Yes")
		set_occupant(user)
		despawn_occupant()

// Used at centcomm for the elevator
/obj/machinery/cryopod/robot/door/dorms
	// spawnpoint_type = /datum/spawnpoint/tram

// I hate this.
/obj/machinery/cryopod/robot/door/dorms/colony
	name = "elevator"
	desc = "A small elevator";
	dir = 2;
	// icon = 'icons/obj/doors/Door2x1glass.dmi';
	icon_state = "door_closed"
	base_icon_state = "door_closed"
	occupied_icon_state = "door_bolted"
	on_enter_occupant_message = "The elevator doors close slowly. You can now head off for the residential, commercial, and other floors."
	on_store_message = "has departed for one of the various colony floors"
	on_store_name = "Colony Oversight"
	// on_store_visible_message_2 = "to the colony districts."
	time_till_despawn = 5
