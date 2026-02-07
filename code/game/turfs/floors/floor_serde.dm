/turf/floor/Serialize()
	// TODO: a less hacky way to skip reagent serialization than unsetting it
	var/datum/reagents/old_reagents // to restore reagents after serialize
	// preprocessing reagents to avoid unnecessary serialization of default contents
	if(istype(reagents) && fill_reagent_type && REAGENT_VOLUME(reagents, fill_reagent_type))
		if(contaminant_reagent_type && length(REAGENT_VOLUMES(reagents)) == 2)
			// we could check proportion here, but i don't think we should, because over time it should return to baseline anyway
			old_reagents = reagents // don't serialize reagents
			reagents = null
		else if(length(REAGENT_VOLUMES(reagents)) <= 1) // 0 reagents -> will refill, 1 reagent -> already refilled (or currently refilling)
			old_reagents = reagents // don't serialize reagents if our only reagent is our fill reagent
			reagents = null
	. = ..()

	SERIALIZE_IF_MODIFIED(_floor_broken, /turf/floor)
	SERIALIZE_IF_MODIFIED(_floor_burned, /turf/floor)
	SERIALIZE_IF_MODIFIED(height, /turf/floor)
	SERIALIZE_DECL_IF_MODIFIED(_base_flooring, /turf/floor)
	SERIALIZE_TYPE_IF_MODIFIED(fill_reagent_type, /turf/floor)

	var/initial_flooring = initial(_flooring)
	if(isnull(_flooring) && !isnull(initial_flooring))
		SERIALIZE_VALUE(_flooring, /turf/floor, json_encode(list()))
	else if((ispath(_flooring) || istype(_flooring, /decl)) && (!ispath(initial_flooring) || !DECLS_ARE_EQUIVALENT(_flooring, initial_flooring)))
		var/decl/flooring/flooring = RESOLVE_TO_DECL(_flooring)
		if(istype(flooring))
			SERIALIZE_VALUE(_flooring, /turf/floor, json_encode(list(flooring.uid)))
	else if(islist(_flooring))
		var/list/flooring_uids
		for(var/floor in _flooring)
			var/decl/flooring/floor_decl = RESOLVE_TO_DECL(floor)
			if(istype(floor_decl))
				LAZYADD(flooring_uids, floor_decl.uid)
		if(!istext(initial_flooring) || !(flooring_uids ~= cached_json_decode(initial_flooring)))
			SERIALIZE_VALUE(_flooring, /turf/floor, json_encode(flooring_uids))

	if(old_reagents)
		reagents = old_reagents

/turf/floor/Deserialize(list/instance_map)
	. = ..()
	DESERIALIZE_DECL_TO_TYPE_IF_MODIFIED(_base_flooring, /turf/floor)
	// _flooring is expected as a JSON list in base floor
	// Initialize(), so no additional deserializing needed here.
	DESERIALIZE_TYPE_IF_MODIFIED(fill_reagent_type, /turf/floor)
	if((nameof(/turf::contaminant_reagent_type) in __deserialization_payload) || (nameof(/turf::contaminant_proportion) in __deserialization_payload) || (nameof(/turf/floor::fill_reagent_type) in __deserialization_payload))
		fill_to_zero_height()
	state_was_modified("deserialized")