// Prevent all mob serde for the time being.
// Equipment handling and the like needs a lot of work to implement.
/mob/ShouldSerialize(_age)
	SHOULD_CALL_PARENT(FALSE)
	return FALSE

/mob/GetPossiblySerializableInstances()
	return null

/mob/living/GetPossiblySerializableInstances()
	. = list(src)
	if(mind)
		. += mind
	var/list/equipped_items = get_equipped_items(include_carried = TRUE)
	if(length(equipped_items))
		. += equipped_items

/mob/living/Serialize()
	. = ..()
	// SERIALIZE_IF_MODIFIED(ckey, /mob) // todo: handle this via mind or something; logging in too early can cause crashes
	SERIALIZE_IF_MODIFIED(name, /mob/living)
	SERIALIZE_IF_MODIFIED(desc, /mob/living)
	SERIALIZE_IF_MODIFIED(stat, /mob/living)
	SERIALIZE_IF_MODIFIED(mob_size, /mob/living)
	SERIALIZE_INSTANCE_IF_MODIFIED(skillset, /mob/living)
	if(istype(ai)) // I'm way too lazy to serialize AI datums, so this will have to do
		SERIALIZE_VALUE(ai, /mob/living, "[ai.type]")
	SERIALIZE_DECL_IF_MODIFIED(default_language, /mob/living)
	if(mind && (stat != DEAD || ((world.time - timeofdeath) < 5 MINUTES))) // arbitrary. don't serialize mind if we're dead and have been dead for over 5 minutes
		SERIALIZE_INSTANCE(mind, /mob/living)
	if(length(languages))
		SERIALIZE_DECL_LIST(languages, /mob/living)
	if(length(_mob_traits)) // list of trait_type -> level
		var/list/serial_mob_traits = list()
		for(var/trait_type in _mob_traits)
			serial_mob_traits["[trait_type]"] = _mob_traits[trait_type]
	// pronouns!
	SERIALIZE_IF_MODIFIED(pronoun_gender, /mob/living)
	SERIALIZE_DECL_IF_MODIFIED(pronouns, /mob/living)
	// inventory!
	var/list/inventory_to_serialize = get_inventory_slots() + get_held_item_slots()
	if(length(inventory_to_serialize))
		// saving inventory as a list of slot id -> item
		var/list/serialized_inventory = list()
		for(var/slot_id in inventory_to_serialize)
			var/datum/inventory_slot/slot = inventory_to_serialize[slot_id]
			if(!slot)
				continue
			var/obj/item/equipped_item = slot.get_equipped_item()
			if(equipped_item)
				serialized_inventory[slot_id] = equipped_item.get_run_uid()
		if(length(serialized_inventory))
			SERIALIZE_KEY_VALUE("inventory", serialized_inventory)
	// TODO: serialize stressors

/mob/living/Deserialize(list/instance_map)
	. = ..()
	if(length(_mob_traits))
		var/list/unserial_mob_traits = list()
		for(var/trait_type in _mob_traits)
			var/value = _mob_traits[trait_type]
			DESERIALIZE_TYPE(trait_type)
			unserial_mob_traits[trait_type] = value
		_mob_traits = unserial_mob_traits
	if(length(languages))
		var/list/new_languages = list()
		for(var/decl_uid in languages)
			var/decl/language/new_language = RESOLVE_TO_DECL(decl_uid)
			if(new_language)
				new_languages += decl_uid
		languages = new_languages
	DESERIALIZE_DECL_IF_MODIFIED(pronouns, /mob/living)
	DESERIALIZE_DECL_IF_MODIFIED(default_language, /mob/living)
	if(istext(ai))
		DESERIALIZE_TYPE(ai) // typepath will be replaced with instance in init
	if(__deserialization_payload[nameof(/mob/living::mind)])
		DESERIALIZE_INSTANCE(mind)
	if(__deserialization_payload[nameof(/mob/living::skillset)])
		DESERIALIZE_INSTANCE(skillset)
	if("inventory" in __deserialization_payload)
		return SERDE_HINT_POSTINIT // we want to do this after we've got (probably) all of our inventory slots set up

/mob/living/DeserializePostInit(list/instance_map)
	. = ..()
	// inventory deserialization
	var/list/inventory_list = __deserialization_payload["inventory"]
	for(var/slot_id in inventory_list)
		var/obj/item/prop = instance_map[inventory_list[slot_id]]
		if(!prop)
			continue
		var/datum/inventory_slot/the_slot = get_inventory_slot_datum(slot_id)
		if(!the_slot) // somehow missing that slot, drop it so it's not lost inside our mob
			prop.dropInto(loc)
			continue
		the_slot.equipped(src, prop) // not sure if this should be equipped or set_slot. probably equipped?