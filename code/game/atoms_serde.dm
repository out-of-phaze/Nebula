/atom
	/// If TRUE, we won't propagate loc.contents_were_modified() via Entered/Exited
	var/_suppress_content_change_update = FALSE

/atom/Serialize()
	. = ..()
	if(current_health != get_max_health())
		SERIALIZE(current_health, /atom)
	if(!isnull(initial(max_health)) || !material) // if initial is null and we have a material, then we auto-set our max health and don't need to serialize
		SERIALIZE_IF_MODIFIED(max_health, /atom)
	SERIALIZE_IF_MODIFIED(dir, /atom)
	SERIALIZE_IF_MODIFIED(gender, /atom)
	if(ATOM_IS_TEMPERATURE_SENSITIVE(src))
		SERIALIZE_IF_MODIFIED(temperature, /atom)
	// we don't serialize atom_flags, so we use this to serialize things like opening cans/etc
	var/default_open_status = initial(atom_flags) & ATOM_FLAG_OPEN_CONTAINER
	var/current_open_status = ATOM_IS_OPEN_CONTAINER(src)
	if(default_open_status != current_open_status)
		SERIALIZE_KEY_VALUE("open_container", current_open_status)
	if(istype(reagents))
		SERIALIZE_REAGENTS(reagents, /atom, "atom")
	SERIALIZE_DECL_IF_MODIFIED(material, /atom)
	SERIALIZE_DECL_IF_MODIFIED(reinf_material, /atom)
	SERIALIZE_IF_MODIFIED(paint_color, /atom)
	// these auto-set from each other
	if(!isnull(default_pixel_x) && pixel_x != default_pixel_x)
		SERIALIZE_IF_MODIFIED(pixel_x, /atom)
	if(!isnull(default_pixel_y) && pixel_y != default_pixel_y)
		SERIALIZE_IF_MODIFIED(pixel_y, /atom)
	// default pixel x and pixel y used to be serialized here, but
	// since those are marked as /tmp, i think they shouldn't be serialized
	// if they should be, readd them and remove the /tmp

// Keeping this in code for reference, but a large number of atoms generate
// name and desc at runtime, so not storing this in serde by default.
/*
	SERIALIZE_IF_MODIFIED(name, /atom)
	SERIALIZE_IF_MODIFIED(desc, /atom)
*/
	// TODO: serialize forensics

/atom/Deserialize(list/instance_map)
	. = ..()
	if("open_container" in __deserialization_payload)
		var/new_open_status = __deserialization_payload["open_container"]
		if(new_open_status)
			atom_flags |= ATOM_FLAG_OPEN_CONTAINER
		else
			atom_flags &= ~(ATOM_FLAG_OPEN_CONTAINER)
	DESERIALIZE_REAGENTS(reagents, "atom") // Handled in initialize_reagents()
	DESERIALIZE_DECL_TO_TYPE_IF_MODIFIED(material, /atom)
	DESERIALIZE_DECL_TO_TYPE_IF_MODIFIED(reinf_material, /atom)

/atom/ShouldSerialize(_age)
	return ..() && simulated

/atom/GetPossiblySerializableInstances()
	. = ..()
	for(var/atom/movable/movable in get_contained_external_atoms())
		if(movable.loc != src) // contents takes into account multitile atoms, which causes issues
			continue
		. |= movable

/atom/Exited(atom/movable/atom, atom/newloc)
	. = ..()
	if(!_suppress_content_change_update && simulated && atom.ShouldSerialize())
		contents_were_modified("[atom] exited")

/atom/Entered(atom/movable/atom, atom/old_loc)
	. = ..()
	if(!_suppress_content_change_update && simulated && atom.ShouldSerialize())
		contents_were_modified("[atom] entered")

