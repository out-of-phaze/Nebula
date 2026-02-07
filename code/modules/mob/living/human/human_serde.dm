/mob/living/human
	// used for serde
	var/datum/mob_snapshot/__serde_snapshot

/mob/living/human/ShouldSerialize(_age)
	return !!mind // if a mob has a mind we should serialize it

/mob/living/human/Serialize()
	. = ..()
	// no handling for serializing /datum/reagents subtypes at the moment
	// SERIALIZE_REAGENTS(bloodstr, /mob/living/human, "bloodstr")
	// SERIALIZE_REAGENTS(touching, /mob/living/human, "touching")
	SERIALIZE_IF_MODIFIED(real_name, /mob/living/human)
	SERIALIZE_INSTANCE_LIST(worn_underwear, /mob/living/human)
	var/list/new_background_info = list()
	for(var/token in background_info)
		var/decl/background_detail/detail = background_info[token]
		new_background_info[token] = detail.uid
	if(length(new_background_info))
		SERIALIZE_VALUE(background_info, /mob/living/human, new_background_info)
	SERIALIZE(flavor_texts, /mob/living/human)
	SERIALIZE_IF_MODIFIED(pose, /mob/living/human)
	SERIALIZE_INSTANCE_IF_MODIFIED(internal, /mob/living/human) // essential to avoid suddenly dying if you're saved in space
	SERIALIZE_INSTANCE(__serde_snapshot, /mob/living/human)
	// notably, we don't serialize organs, we just hope snapshot will do enough of it for us
	// that might come back to bite us, idk
	// todo: save organ injury state somehow. mapping of external organ tag -> wounds list, internal organ tag -> organ damage?
	// in theory we could serialize them directly but is that really a good idea?
	// also todo: organ implants, autopsy data, splints...

// we have to create our snapshot here for ordering reasons
// i know, it sucks
/mob/living/human/GetPossiblySerializableInstances()
	. = ..()
	__serde_snapshot = get_mob_snapshot(include_transplants = TRUE)
	. += __serde_snapshot
	if(length(worn_underwear))
		. += worn_underwear

/mob/living/human/Deserialize(list/instance_map)
	. = ..()
	DESERIALIZE_INSTANCE(__serde_snapshot)
	DESERIALIZE_INSTANCE_LIST(worn_underwear)
	DESERIALIZE_DECL_TYPE_LIST_ASSOC(background_info)
	DESERIALIZE_INSTANCE(internal)

// override with serde snapshot
/mob/living/human/setup_human(species_uid, datum/mob_snapshot/supplied_appearance)
	. = ..(species_uid, __serde_snapshot || supplied_appearance)
	if(__serde_snapshot)
		__serde_snapshot = null // don't just leave mob snapshots laying around