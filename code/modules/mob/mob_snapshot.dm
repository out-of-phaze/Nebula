// Stub type used to replicate old DNA system's role in mob/organ initialization.
// Effectively a snapshot of a mob's state at a moment in time.
/datum/mob_snapshot
	var/real_name
	var/eye_color
	var/blood_type
	var/unique_enzymes
	var/skin_color
	var/skin_tone
	var/fingerprint

	var/decl/species/root_species
	var/decl/bodytype/root_bodytype

	/// list of the format sprite_accessories[organ_tag][accessory_category][accessory_decl] = metadata || null
	var/list/sprite_accessories
	var/list/genetic_conditions
	/// Please find a better way to do this. This is done to add tails if we have the tail accessory selected...
	var/list/extra_limbs

/datum/mob_snapshot/New(mob/living/donor, genetic_info_only = FALSE, include_transplants = FALSE)

	if(!istype(donor))
		return

	real_name      = donor.real_name        || "unknown"
	eye_color      = donor.get_eye_colour() || COLOR_BLACK
	blood_type     = donor.get_blood_type()
	unique_enzymes = donor.get_unique_enzymes()
	skin_color     = donor.get_skin_colour()
	skin_tone      = donor.get_skin_tone()
	fingerprint    = donor.get_full_print(ignore_blockers = TRUE)

	root_species   = donor.get_species()  || decls_repository.get_decl_by_id(global.using_map.default_species)
	root_bodytype  = donor.get_bodytype() || root_species.default_bodytype

	for(var/obj/item/organ/external/limb in donor?.get_external_organs())
		// Discard anything not relating to our core/original bodytype and species.
		// Does this need to be reviewed for Outreach serde?
		if(include_transplants || (limb.bodytype == root_bodytype && limb.species == root_species && (!genetic_info_only || !BP_IS_PROSTHETIC(limb))))
			var/list/limb_sprite_acc = limb.get_sprite_accessories(copy = TRUE)
			if(length(limb_sprite_acc))
				LAZYSET(sprite_accessories, limb.organ_tag, limb_sprite_acc)

	genetic_conditions = donor?.get_genetic_conditions()?.Copy()
	for(var/decl/genetic_condition/condition as anything in genetic_conditions)
		if(!include_transplants && !condition.is_heritable)
			LAZYREMOVE(genetic_conditions, condition)

/datum/mob_snapshot/Serialize()
	. = ..()
	SERIALIZE_KEY_VALUE("args", list(null, FALSE, TRUE)) // allow non-genetic, include transplants
	SERIALIZE(real_name, /datum/mob_snapshot)
	SERIALIZE(eye_color, /datum/mob_snapshot)
	SERIALIZE(blood_type, /datum/mob_snapshot)
	SERIALIZE(unique_enzymes, /datum/mob_snapshot)
	SERIALIZE(skin_color, /datum/mob_snapshot)
	SERIALIZE(skin_tone, /datum/mob_snapshot)
	SERIALIZE(fingerprint, /datum/mob_snapshot)
	SERIALIZE_DECL_LIST(genetic_conditions, /datum/mob_snapshot)
	SERIALIZE_DECL_IF_MODIFIED(root_species, /datum/mob_snapshot)
	SERIALIZE_DECL_IF_MODIFIED(root_bodytype, /datum/mob_snapshot)
	if(length(sprite_accessories))
		// we take a list of the format sprite_accessories[organ_tag][accessory_category][accessory_decl][metadata_type] = metadata
		// and produce a list of the format sprite_accessories[organ_tag][category_uid][accessory_uid][metadata_uid] = metadata
		var/list/serial_sprite_accessories
		for(var/organ_tag in sprite_accessories)
			var/list/serial_organ_accessories = list()
			for(var/category_path in sprite_accessories[organ_tag])
				var/decl/sprite_accessory_category/category = GET_DECL(category_path)
				if(!category)
					continue
				var/list/category_list = sprite_accessories[organ_tag][category_path]
				for(var/accessory_type in category_list)
					var/decl/sprite_accessory/accessory = GET_DECL(accessory_type)
					if(!accessory)
						continue
					// /decl/sprite_accessory_metadata path -> metadata list
					for(var/metadata_type in category_list[accessory_type])
						LAZYINITLIST(serial_organ_accessories[category.uid])
						var/decl/sprite_accessory_metadata/metadata_instance = GET_DECL(metadata_type)
						LAZYSET(serial_organ_accessories[category.uid][accessory.uid], metadata_instance.uid, category_list[accessory_type][metadata_type])
			if(length(serial_organ_accessories))
				LAZYSET(serial_sprite_accessories, organ_tag, serial_organ_accessories)
		if(length(serial_sprite_accessories))
			SERIALIZE_VALUE(sprite_accessories, /datum/mob_snapshot, serial_sprite_accessories)

/datum/mob_snapshot/Deserialize(list/instance_map)
	. = ..()
	DESERIALIZE_DECL_IF_MODIFIED(root_species, /datum/mob_snapshot)
	DESERIALIZE_DECL_IF_MODIFIED(root_bodytype, /datum/mob_snapshot)
	if(nameof(/datum/mob_snapshot::sprite_accessories) in __deserialization_payload)
		// we need to un-serialize sprite accesories ugh
		// basically replace category uid with category type
		// replace accessory uid with accessory type
		// and replace metadata uid with metadata type
		var/new_sprite_accessories = list()
		for(var/organ_tag in sprite_accessories)
			new_sprite_accessories[organ_tag] = list()
			for(var/category_uid in sprite_accessories[organ_tag])
				var/category_type = decls_repository.get_decl_path_by_id(category_uid)
				new_sprite_accessories[organ_tag][category_type] = list()
				for(var/accessory_uid in sprite_accessories[organ_tag][category_uid])
					var/accessory_type = decls_repository.get_decl_path_by_id(accessory_uid)
					new_sprite_accessories[organ_tag][category_type][accessory_type] = list()
					for(var/metadata_uid in sprite_accessories[organ_tag][category_uid][accessory_uid])
						var/metadata_type = decls_repository.get_decl_path_by_id(metadata_uid)
						new_sprite_accessories[organ_tag][category_type][accessory_type][metadata_type] = sprite_accessories[organ_tag][category_uid][accessory_uid][metadata_uid]
			sprite_accessories = new_sprite_accessories
		// i hate my life

	var/new_genetic_conditions = list()
	for(var/genetic_condition_uid in genetic_conditions)
		new_genetic_conditions += RESOLVE_TO_DECL(genetic_condition_uid)
	genetic_conditions = new_genetic_conditions

/datum/mob_snapshot/PopulateClone(datum/mob_snapshot/clone)
	clone = ..()
	if(clone)
		clone.real_name          = real_name
		clone.eye_color          = eye_color
		clone.blood_type         = blood_type
		clone.unique_enzymes     = unique_enzymes
		clone.skin_color         = skin_color
		clone.skin_tone          = skin_tone
		clone.fingerprint        = fingerprint
		clone.genetic_conditions = genetic_conditions?.Copy()
		clone.root_species       = root_species
		clone.root_bodytype      = root_bodytype
		if(sprite_accessories)
			clone.sprite_accessories = deepCopyList(sprite_accessories)
	return clone

// Replaces UpdateAppearance().
/datum/mob_snapshot/proc/apply_appearance_to(mob/living/target, do_update = TRUE)

	if(istype(root_species) && root_species != target.get_species())
		if(istype(root_bodytype))
			target.set_species(root_species.uid, root_bodytype)
		else
			target.set_species(root_species.uid)
	else if(istype(root_bodytype) && target.get_bodytype() != root_bodytype)
		target.set_bodytype(root_bodytype)

	target.set_fingerprint(fingerprint)
	target.set_unique_enzymes(unique_enzymes)
	target.set_skin_colour(skin_color)
	target.set_eye_colour(eye_color)
	target.set_skin_tone(skin_tone)

	for(var/limb_data in extra_limbs)

		// Grab our limb type for checking.
		var/limb_path = extra_limbs[limb_data]["path"]

		// For whatever reason, we already have a limb in this slot.
		// Creating a new one without removing the old one would cause limb overwrite runtimes.
		var/obj/item/organ/external/limb = target.get_organ(limb_data)
		if(istype(limb))
			// TODO: some way to cleanly remove and restitch an organ up the limb chain.
			if(length(limb.children))
				continue
			// If it's already the appropriate type, we're probably safe to leave it.
			if(limb.type == limb_path)
				continue
			// Snip off the limb so we can replace it without issues.
			target.remove_organ(limb, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE)

		// Create and install the new limb.
		target.add_organ(new limb_path(null, null, src), null, TRUE, FALSE, FALSE, TRUE)

	extra_limbs = null // can't reuse it!

	for(var/obj/item/organ/organ in target.get_organs())
		organ.copy_from_mob_snapshot(src)

	for(var/decl/genetic_condition/condition as anything in genetic_conditions)
		target.add_genetic_condition(condition.type)

	if(do_update)
		target.force_update_limbs()
		target.update_hair(update_icons = FALSE)
		target.update_eyes()
	return TRUE

/mob/proc/get_mob_snapshot(check_dna = FALSE, include_transplants = FALSE)
	RETURN_TYPE(/datum/mob_snapshot)
	return (!check_dna || has_genetic_information()) ? new /datum/mob_snapshot(src, genetic_info_only = check_dna, include_transplants = include_transplants) : null
