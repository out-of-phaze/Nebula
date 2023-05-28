#define SETUP_OK 1			// All good
#define SETUP_WARNING 2		// Something that shouldn't happen happened, but it's not critical so we will continue
#define SETUP_ERROR 3		// Something bad happened, and it's important so we won't continue setup.
#define SETUP_DELAYED 4		// Wait for other things first.

#define ENERGY_NITROGEN 115			// Roughly 8 emitter shots.
#define ENERGY_CARBONDIOXIDE 150	// Roughly 10 emitter shots.
#define ENERGY_HYDROGEN 300			// Roughly 20 emitter shots.
#define ENERGY_PHORON 500			// Roughly 40 emitter shots.

/datum/admins/proc/setup_supermatter()
	set category = "Debug"
	set name = "Setup Supermatter"
	set desc = "Allows you to start the Supermatter engine."

	if (!istype(src,/datum/admins))
		src = usr.client.holder
	if (!istype(src,/datum/admins))
		to_chat(usr, "Error: you are not an admin!")
		return

	var/response = input(usr, "Are you sure? This will start up the engine with selected gas as coolant.", "Engine setup") as null|anything in list("N2", "CO2", "PH", "H2", "Abort")
	if(!response || response == "Abort")
		return

	var/errors = 0
	var/warnings = 0
	var/success = 0

	log_and_message_admins("## SUPERMATTER SETUP - Setup initiated by [usr] using coolant type [response].")

	// CONFIGURATION PHASE
	// Coolant canisters, set types according to response.
	for(var/obj/effect/engine_setup/coolant_canister/C in global.engine_setup_markers)
		switch(response)
			if("N2")
				C.canister_type = /obj/machinery/portable_atmospherics/canister/nitrogen/engine_setup/
				continue
			if("CO2")
				C.canister_type = /obj/machinery/portable_atmospherics/canister/carbon_dioxide/engine_setup/
				continue
			if("PH")
				C.canister_type = /obj/machinery/portable_atmospherics/canister/phoron/engine_setup/
				continue
			if("H2")
				C.canister_type = /obj/machinery/portable_atmospherics/canister/hydrogen/engine_setup/
				continue

	for(var/obj/effect/engine_setup/core/C in global.engine_setup_markers)
		switch(response)
			if("N2")
				C.energy_setting = ENERGY_NITROGEN
				continue
			if("CO2")
				C.energy_setting = ENERGY_CARBONDIOXIDE
				continue
			if("PH")
				C.energy_setting = ENERGY_PHORON
				continue
			if("H2")
				C.energy_setting = ENERGY_HYDROGEN
				continue

	for(var/obj/effect/engine_setup/filter/F in global.engine_setup_markers)
		F.coolant = response

	var/list/delayed_objects = list()
	// SETUP PHASE
	for(var/obj/effect/engine_setup/S in global.engine_setup_markers)
		var/result = S.activate(0)
		switch(result)
			if(SETUP_OK)
				success++
				continue
			if(SETUP_WARNING)
				warnings++
				continue
			if(SETUP_ERROR)
				errors++
				log_and_message_admins("## SUPERMATTER SETUP - Error encountered! Aborting.")
				break
			if(SETUP_DELAYED)
				delayed_objects.Add(S)
				continue

	if(!errors)
		for(var/obj/effect/engine_setup/S in delayed_objects)
			var/result = S.activate(1)
			switch(result)
				if(SETUP_OK)
					success++
					continue
				if(SETUP_WARNING)
					warnings++
					continue
				if(SETUP_ERROR)
					errors++
					log_and_message_admins("## SUPERMATTER SETUP - Error encountered! Aborting.")
					break

	log_and_message_admins("## SUPERMATTER SETUP - Setup completed with [errors] errors, [warnings] warnings and [success] successful steps.")

	return



var/global/list/engine_setup_markers = list()

/obj/effect/engine_setup
	name = "Engine Setup Marker"
	desc = "You shouldn't see this."
	invisibility = INVISIBILITY_ABSTRACT
	anchored = TRUE
	density = FALSE
	icon = 'icons/effects/markers.dmi'
	icon_state = "x3"

/obj/effect/engine_setup/Initialize()
	. = ..()
	global.engine_setup_markers += src

/obj/effect/engine_setup/Destroy()
	global.engine_setup_markers -= src
	. = ..()

/obj/effect/engine_setup/proc/activate(var/last = 0)
	return 1



// Tries to locate a pump, enables it, and sets it to MAX. Triggers warning if unable to locate a pump.
/obj/effect/engine_setup/pump_max/
	name = "Pump Setup Marker"

/obj/effect/engine_setup/pump_max/activate()
	..()
	var/obj/machinery/atmospherics/binary/pump/P = locate() in get_turf(src)
	if(!P)
		log_and_message_admins("## WARNING: Unable to locate pump at [x] [y] [z]!")
		return SETUP_WARNING
	P.target_pressure = P.max_pressure_setting
	P.update_use_power(POWER_USE_IDLE)
	return SETUP_OK



// Spawns an empty canister on this turf, if it has a connector port. Triggers warning if unable to find a connector port
/obj/effect/engine_setup/empty_canister/
	name = "Empty Canister Marker"

/obj/effect/engine_setup/empty_canister/activate()
	..()
	var/obj/machinery/atmospherics/portables_connector/P = locate() in get_turf(src)
	if(!P)
		log_and_message_admins("## WARNING: Unable to locate connector port at [x] [y] [z]!")
		return SETUP_WARNING
	new/obj/machinery/portable_atmospherics/canister(get_turf(src)) // Canisters automatically connect to connectors in New()
	return SETUP_OK




// Spawns a coolant canister on this turf, if it has a connector port.
// Triggers error when unable to locate connector port or when coolant canister type is unset.
/obj/effect/engine_setup/coolant_canister/
	name = "Coolant Canister Marker"
	var/canister_type = null

/obj/effect/engine_setup/coolant_canister/activate()
	..()
	var/obj/machinery/atmospherics/portables_connector/P = locate() in get_turf(src)
	if(!P)
		log_and_message_admins("## ERROR: Unable to locate coolant connector port at [x] [y] [z]!")
		return SETUP_ERROR
	if(!canister_type)
		log_and_message_admins("## ERROR: Canister type unset at [x] [y] [z]!")
		return SETUP_ERROR
	new canister_type(get_turf(src))
	return SETUP_OK



// Energises the supermatter. Errors when unable to locate supermatter.
/obj/effect/engine_setup/core/
	name = "Supermatter Core Marker"
	var/energy_setting = 0

/obj/effect/engine_setup/core/activate(var/last = 0)
	if(!last)
		return SETUP_DELAYED
	..()
	var/obj/machinery/power/supermatter/SM = locate() in get_turf(src)
	if(!SM)
		log_and_message_admins("## ERROR: Unable to locate supermatter core at [x] [y] [z]!")
		return SETUP_ERROR
	if(!energy_setting)
		log_and_message_admins("## ERROR: Energy setting unset at [x] [y] [z]!")
		return SETUP_ERROR
	SM.power = energy_setting
	return SETUP_OK



// Tries to enable the SMES on max input/output settings. With load balancing it should be fine as long as engine outputs at least ~500kW
/obj/effect/engine_setup/smes
	name = "SMES Marker"

	var/target_input_level		//These are in watts, the display is in kilowatts. Add three zeros to the value you want.
	var/target_output_level		//These are in watts, the display is in kilowatts. Add three zeros to the value you want.

/obj/effect/engine_setup/smes/main
	name = "Main SMES Marker"
	target_input_level =  INFINITY
	target_output_level = INFINITY

/obj/effect/engine_setup/smes/activate()
	..()
	var/obj/machinery/power/smes/S = locate() in get_turf(src)
	if(!S)
		log_and_message_admins("## WARNING: Unable to locate SMES unit at [x] [y] [z]!")
		return SETUP_WARNING
	S.input_attempt = 1
	S.input_level = min(target_input_level, S.input_level_max)
	S.output_attempt = 1
	S.output_level = min(target_output_level, S.output_level_max)
	S.update_icon()
	return SETUP_OK

// Sets up filters. This assumes filters are set to filter out CO2 back to the core loop by default!
/obj/effect/engine_setup/filter
	name = "Omni Filter Marker"
	var/coolant = null

/obj/effect/engine_setup/filter/activate()
	..()
	var/obj/machinery/atmospherics/omni/filter/F = locate() in get_turf(src)
	if(!F)
		log_and_message_admins("## WARNING: Unable to locate omni filter at [x] [y] [z]!")
		return SETUP_WARNING
	if(!coolant)
		log_and_message_admins("## WARNING: No coolant type set at [x] [y] [z]!")
		return SETUP_WARNING

	// Non-co2 coolant, adjust the filter's config first.
	if(coolant != "CO2")
		for(var/datum/omni_port/P in F.ports)
			if(P.filtering != /decl/material/gas/carbon_dioxide)
				continue
			else if(coolant == "N2")
				P.filtering = /decl/material/gas/nitrogen
				break
			if(coolant == "PH")
				P.filtering = /decl/material/solid/phoron
				break
			else if(coolant == "H2")
				P.filtering = /decl/material/gas/hydrogen
				break
			else
				log_and_message_admins("## WARNING: Inapropriate filter coolant type set at [x] [y] [z]!")
				return SETUP_WARNING
		F.rebuild_filtering_list()

	F.update_use_power(POWER_USE_IDLE)
	return SETUP_OK

// Closes the monitoring room shutters so the first Engi to show up doesn't get microwaved
/obj/effect/engine_setup/shutters
	name = "Shutter Button Marker"
	// This needs to be set to whatever the shutter button is called
	var/target_button = "Engine Monitoring Room Blast Doors"

/obj/effect/engine_setup/shutters/activate()
	if(!target_button)
		log_and_message_admins("## WARNING: No button type set at [x] [y] [z]!")
		return SETUP_WARNING
	var/obj/machinery/button/blast_door/found = null
	var/turf/T = get_turf(src)
	for(var/obj/machinery/button/blast_door/B in T.contents)
		if(B.name == target_button)
			found = B
			break
	if(!found)
		log_and_message_admins("## WARNING: Unable to locate button at [x] [y] [z]!")
		return SETUP_WARNING
	found.activate()
	found.update_icon()
	return SETUP_OK

#undef SETUP_OK
#undef SETUP_WARNING
#undef SETUP_ERROR
#undef SETUP_DELAYED
#undef ENERGY_NITROGEN
#undef ENERGY_CARBONDIOXIDE
#undef ENERGY_HYDROGEN
#undef ENERGY_PHORON