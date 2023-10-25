/datum/appearance_descriptor/age/replika
	chargen_min_index = 1
	chargen_max_index = 4
	standalone_value_descriptors = list(
		"brand new" =            1,
		"worn" =                 3,
		"an older model" =      6,
		"nearing end-of-life" = 8,
		"entirely obsolete" =   12
	)

// Robo-blood.
/decl/blood_type/oxidant

	name = "oxidant fluid"
	antigen_category = "oxidant"

	splatter_name = "oxidant fluid"
	splatter_desc = "A smear of Replika oxidant fluid."
	splatter_colour = "#4d0001"

	transfusion_fail_reagent = /decl/material/liquid/acid


/decl/species/replika
	name =                  SPECIES_REPLIKA
	name_plural =           "Replikas"
	description =           "Artificial humanoids made of bioengineered flesh and created using Gestalt neural patterns."
	cyborg_noun = null
	base_prosthetics_model = null

	blood_types = list(/decl/blood_type/oxidant)

	appearance_descriptors = null

	available_bodytypes = list(
		/decl/bodytype/replika/eulr,
		/decl/bodytype/replika/arar,
		/decl/bodytype/replika/lstr,
		/decl/bodytype/replika/star,
		/decl/bodytype/replika/klbr
	)
	age_descriptor =        /datum/appearance_descriptor/age/replika
	hidden_from_codex =     FALSE
	spawn_flags =           SPECIES_CAN_JOIN
	warning_low_pressure =  50
	hazard_low_pressure =  -1
	flesh_color =           COLOR_OFF_WHITE

	preview_outfit = null

	heat_discomfort_strings = list(
		"You are dangerously close to overheating!"
	)
	unarmed_attacks = list(
		/decl/natural_attack/stomp,
		/decl/natural_attack/kick,
		/decl/natural_attack/punch
	)
	default_pronouns = /decl/pronouns/female
	available_pronouns = list(
		/decl/pronouns,
		/decl/pronouns/female,
		/decl/pronouns/male,
		/decl/pronouns/neuter,
		/decl/pronouns/neuter/person
	)
	available_cultural_info = list(
		TAG_CULTURE = list(/decl/cultural_info/culture/synthetic/replika)
	)

	exertion_effect_chance = 10
	exertion_charge_scale = 1
	exertion_emotes_synthetic = list(
		/decl/emote/exertion/synthetic,
		/decl/emote/exertion/synthetic/creak
	)

	hud_type = /datum/hud_data/replika

	traits = list(/decl/trait/biosynthetic_healing = TRAIT_LEVEL_EXISTS)

/decl/cultural_info/culture/synthetic/replika
	name = "Replika"
	description = "You are a biosynthetic humanoid created by the Nation to serve as their primary workforce."

/decl/cultural_info/culture/synthetic/replika/get_random_name(mob/M, gender)
	var/decl/species/our_species = get_species_by_key(M?.client?.prefs?.species)
	if(our_species?.get_root_species_name() != SPECIES_REPLIKA)
		return ..()
	var/decl/bodytype/replika/our_bodytype = our_species.get_bodytype_by_name(M.client.prefs.bodytype)
	return our_bodytype.get_default_name()

/decl/species/replika/equip_survival_gear(mob/living/carbon/human/victim)
	. = ..()
	var/obj/item/storage/backpack/backpack = victim.get_equipped_item(slot_back_str)
	if(istype(backpack))
		victim.equip_to_slot_or_store_or_drop(new /obj/item/storage/box/survival/replika(backpack), slot_in_backpack_str)

/datum/hud_data/replika
	inventory_slots = list(
		/datum/inventory_slot/handcuffs,
		/datum/inventory_slot/suit,
		/datum/inventory_slot/mask,
		/datum/inventory_slot/gloves,
		/datum/inventory_slot/glasses,
		/datum/inventory_slot/ear,
		/datum/inventory_slot/ear/right,
		/datum/inventory_slot/head,
		/datum/inventory_slot/suit_storage,
		/datum/inventory_slot/back,
		/datum/inventory_slot/id,
		/datum/inventory_slot/pocket,
		/datum/inventory_slot/pocket/right,
		/datum/inventory_slot/belt
	)