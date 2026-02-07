// Used for saving instances via the level persistence system.
// Returns an assoc list of var name to var value.
// Expected format is:
// list("field" = "value", "so on" = "so forth"))
// Using a var name (via nameof() or manually) will automatically load the var to the field in Deserialize.
// If serializing an instance reference, use get_run_uid() to get a UID.
/datum
	var/__has_post_serialize = FALSE
	/// Var for holding serde information when this datum was loaded from a persistent source.
	var/__deserialization_payload

/datum/proc/DoSerialize()
	SHOULD_NOT_OVERRIDE(TRUE)
	if(__has_post_serialize)
		return PostSerialize(Serialize())
	else
		return Serialize()

/datum/proc/Serialize()
	SHOULD_CALL_PARENT(TRUE)
	. = list((nameof(/datum::type)) = GetSerializedType())

/datum/proc/PostSerialize(var/list/serialized_data)
	return serialized_data

/datum/proc/Deserialize(list/instance_map)
	SHOULD_CALL_PARENT(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	for(var/data_key in __deserialization_payload)
		if(data_key in vars)
			try
				if(!global._forbid_field_load[data_key])
					vars[data_key] = __deserialization_payload[data_key]
				else
					PreloadKey(data_key, __deserialization_payload[data_key])
			catch(var/exception/E)
				error("Failed to write [data_key] to [type] vars: [E]")
	return SERDE_HINT_FINISHED

// Called when an instance is being preloaded with information from deserialization.
/datum/proc/Preload(list/instance_map)
	SHOULD_CALL_PARENT(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	var/turf/turf = get_turf(src)
	if(__deserialization_payload)
		try
			. = Deserialize(instance_map)
		catch(var/exception/E)
			PRINT_STACK_TRACE("Exception when deserializing [type] at ([turf?.x || "NULL"],[turf?.y || "NULL"],[turf?.z || "NULL"]): [E]")
	else
		PRINT_STACK_TRACE("[type] at ([turf?.x || "NULL"],[turf?.y || "NULL"],[turf?.z || "NULL"]) tried to preload with no deserialization payload.")

/datum/proc/PreloadKey(data_key, payload)
	return

/datum/proc/GetSerializedType()
	return type

/datum/proc/GetPossiblySerializableInstances()
	return list(src)

// A proc for checking preconditions on an instance to determine if it should bother serializing at all.
/datum/proc/ShouldSerialize(_age)
	SHOULD_CALL_PARENT(TRUE)
	return TRUE

// Returns a UID for this instance, used for serde across rounds.
// Probably-kind-of a GUID but only for this run.
/datum/proc/get_run_uid()
	if(isnull(__run_uid))
		__run_uid = "\ref[src]-[sequential_id(type)]" // Staple seq_id on there in case of \ref reuse.
	return __run_uid

// Called after Initialize()/LateInitialize() if a datum returns SERDE_HINT_POSTINIT to Deserialize().
/datum/proc/DeserializePostInit(list/instance_map)
	return

// Apply cross-round degradation (graffiti decaying, etc) prior to Deserialize() and Initialize()
// Typically this means modifying __deserialization_payload
/datum/proc/HandlePersistentDecay(entries_decay_at, entry_decay_weight)
	return
