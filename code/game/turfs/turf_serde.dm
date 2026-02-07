/turf
	/// The first type for this turf (a turf instance is a specific coordinate and persists between new()s). Null if it hasn't been changed.
	var/_earliest_type
	var/_earliest_area
	var/_state_was_modified
	var/_contents_were_modified

/turf/ShouldSerialize(_age)
	if((!_earliest_type || type == _earliest_type) && loc == _earliest_area && !_state_was_modified && !_contents_were_modified)
		return FALSE
	var/area/area = get_area(src)
	if(!(area?.area_flags & AREA_FLAG_ALLOW_LEVEL_PERSISTENCE))
		return FALSE
	return ..(_age)

/turf/Serialize()
	. = ..()
	SERIALIZE_VALUE(loc, /turf, list(x, y, z))
	if(_earliest_area && loc != _earliest_area)
		var/area/our_area = loc
		if(!our_area.is_original)
			SERIALIZE_KEY_VALUE("area", loc.get_run_uid())
		else
			SERIALIZE_KEY_VALUE("area", loc.type)
	SERIALIZE_IF_MODIFIED(is_outside, /turf)
	SERIALIZE_TYPE_IF_MODIFIED(contaminant_reagent_type, /turf)
	SERIALIZE_IF_MODIFIED(contaminant_proportion, /turf)

/turf/Deserialize(list/instance_map)
	. = ..()
	if("area" in __deserialization_payload)
		var/area/area_instance = instance_map[__deserialization_payload["area"]]
		if(isarea(area_instance))
			ChangeArea(src, area_instance)
		else
			var/area_type = __deserialization_payload["area"]
			DESERIALIZE_TYPE(area_type) // this avoids CI getting dinged for a text2path usage :)
			if(area_type)
				ChangeArea(src, locate(area_type))
		DESERIALIZE_TYPE(contaminant_reagent_type)

// turfs are special; due to them not being movable, we don't have to serialize them if they only contain loc and type.
/turf/__has_post_serialize = TRUE
/turf/PostSerialize(var/list/serialized_data)
	// special case; this turf was marked as modified but none of its changes were actually serialized, so it can be skipped
	if(length(serialized_data) == 2) // we will always have name+loc in our payload, so if our len is 2 we know we have nothing else to save
		if(_earliest_type == type)
			return null // don't return anything, skip serializing this turf
	return ..()

/turf/proc/state_was_modified(cause = TRUE)
	if(!simulated || _state_was_modified)
		return
	_state_was_modified = cause
	update_level_persistence_tracking()

/atom/proc/contents_were_modified(cause = TRUE)
	var/turf/turf = get_turf(src)
	turf?.contents_were_modified(cause)

/turf/contents_were_modified(cause = TRUE)
	if(!simulated || _contents_were_modified)
		return
	_contents_were_modified = cause
	update_level_persistence_tracking()

/turf/proc/update_level_persistence_tracking()
	var/area/area = get_area(src)
	if(!(area?.area_flags & AREA_FLAG_ALLOW_LEVEL_PERSISTENCE))
		return
	var/datum/level_data/level = SSmapping.levels_by_z[z]
	if(!istype(level) || !level.is_persistent())
		return
	var/list/coord = json_encode(list(x, y))
	LAZYSET(level.changed_turfs, coord, TRUE)

/turf/GetPossiblySerializableInstances()
	. = ..()
	if(loc && loc != _earliest_area)
		. += loc

/turf/proc/UnpackSerializableInstances()
	// Get all recursively nested instances on this turf.
	var/list/instances_to_unpack = list(src)
	while(length(instances_to_unpack))
		var/datum/instance = instances_to_unpack[1]
		instances_to_unpack.Cut(1, 2)
		if(instance in .)
			continue
		LAZYADD(., instance)
		var/list/packed_instances = instance.GetPossiblySerializableInstances()
		if(length(packed_instances))
			instances_to_unpack |= packed_instances
