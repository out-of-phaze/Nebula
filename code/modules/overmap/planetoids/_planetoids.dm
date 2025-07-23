/////////////////////////////////////////////////////////////////////////
// Planetoid
/////////////////////////////////////////////////////////////////////////

///Overmap marker for a planet-like entity.
/obj/effect/overmap/visitable/sector/planetoid
	name         = "planetoid"
	icon         = 'icons/obj/overmap.dmi'
	icon_state   = "globe"
	free_landing = TRUE
	sector_flags = 0 //By default, can't space walk over there
	color        = "#4e3570"

	///ID of the associated planetoid data id for lookup.
	var/planetoid_id
	///The icon file to use for this planetoid's skybox image
	var/icon/skybox_icon = 'icons/skybox/planet.dmi'
	///Skybox background image when floating in space above this sector. Generated at runtime
	var/tmp/image/skybox_image
	///Color of the primary layer of the skybox image
	var/surface_color = COLOR_ASTEROID_ROCK
	///Color of the secondary layer of the skybox image. Is usually water-like features.
	var/water_color = "#436499"

/obj/effect/overmap/visitable/sector/planetoid/Initialize(mapload)
	. = ..()
	if(length(planetoid_id))
		var/datum/planetoid_data/P = get_planetoid_data()
		P.set_overmap_marker(src)

///Returns the /datum/planetoid_data associated with planet this overmap marker represents.
/obj/effect/overmap/visitable/sector/planetoid/proc/get_planetoid_data()
	return LAZYACCESS(SSmapping.planetoid_data_by_id, planetoid_id)

///Returns the planetoid's atmosphere if there's any
/obj/effect/overmap/visitable/sector/planetoid/proc/get_atmosphere()
	var/datum/planetoid_data/P = get_planetoid_data()
	return P.atmosphere

///Returns the strata associated to the planetoid we represent
/obj/effect/overmap/visitable/sector/planetoid/proc/get_strata()
	var/datum/planetoid_data/P = get_planetoid_data()
	return P.strata

///Update our name, and refs to match the planetoid we're representing
/obj/effect/overmap/visitable/sector/planetoid/proc/update_from_data(var/datum/planetoid_data/P)
	SetName("[P.name], \a [initial(name)]")
	planetoid_id  = P.id
	surface_color = P.surface_color
	water_color   = P.water_color

/obj/effect/overmap/visitable/sector/planetoid/get_scan_data(mob/user)
	. = ..()
	. += "<br>"
	var/datum/gas_mixture/atmosphere = get_atmosphere()
	if(atmosphere)
		// SPACEFARERS EDIT - use combined science + atmos instead of checking for expert across the board
		var/combined_level = user.get_skill_value(SKILL_SCIENCE) + user.get_skill_value(SKILL_ATMOS)
		switch(combined_level)
			if(SKILL_EXPERT to INFINITY)
				var/list/gases = list()
				for(var/g in atmosphere.gas)
					if(atmosphere.gas[g] > atmosphere.total_moles * 0.05)
						var/decl/material/mat = GET_DECL(g)
						gases += mat.gas_name
				. += "Atmosphere composition: [english_list(gases)]<br>"
				var/inaccuracy = rand(8,12)/10
				. += "Atmosphere pressure [atmosphere.return_pressure()*inaccuracy] kPa, temperature [atmosphere.temperature*inaccuracy] K<br>"
			if(SKILL_BASIC to SKILL_EXPERT)
				. += "Atmosphere present. Sensor suite calibration required for detailed scan. Contact a qualified technician for calibration assistance.<br>"
		// END SPACEFARERS EDIT
		. += "<br>"

	var/datum/planetoid_data/E = get_planetoid_data()
	for(var/datum/exoplanet_theme/T in E.themes)
		if(T.get_sensor_data())
			. += jointext(T.get_sensor_data(), "<br>")
	. += "<br>"
