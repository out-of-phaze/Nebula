/turf/floor
	VAR_PROTECTED/decl/material/floor_material as OD_INST(/decl/material)|OD_PATH(/decl/material)|null

/turf/floor/set_turf_materials(decl/material/new_material as OD_INST(/decl/material)|OD_PATH(/decl/material)|null, decl/material/new_reinf_material as OD_INST(/decl/material)|OD_PATH(/decl/material)|null, force, decl/material/new_girder_material as OD_INST(/decl/material)|OD_PATH(/decl/material)|null, skip_update)

	if(ispath(new_material))
		new_material = GET_DECL(new_material)

	if(floor_material != new_material || force)
		floor_material = new_material
		if(!istype(floor_material))
			if(floor_material)
				PRINT_STACK_TRACE("Floor turf has been supplied non-material '[istype(floor_material, /datum) ? floor_material.type : (floor_material || "NULL")]'.")
			floor_material = get_default_material()
		. = TRUE

	if(. && !skip_update)
		queue_icon_update()

/turf/floor/get_material()
	var/decl/flooring/flooring = get_topmost_flooring()
	if(istype(flooring) && istype(flooring.force_material))
		return flooring.force_material
	return floor_material
