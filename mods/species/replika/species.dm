/datum/appearance_descriptor/age/replika
	chargen_min_index = 1
	chargen_max_index = 4
	standalone_value_descriptors = list(
		"brand new" =            1,
		"worn" =                 5,
		"an older model" =      12,
		"nearing end-of-life" = 16,
		"entirely obsolete" =   20
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
	vital_organs = list(
		BP_POSIBRAIN,
		BP_CELL
	)

	available_bodytypes = list(/decl/bodytype/replika/eulr, /decl/bodytype/replika/arar, /decl/bodytype/replika/lstr)
	age_descriptor =        /datum/appearance_descriptor/age/replika
	hidden_from_codex =     FALSE
	species_flags =         SPECIES_FLAG_SYNTHETIC
	spawn_flags =           SPECIES_CAN_JOIN
	warning_low_pressure =  50
	hazard_low_pressure =  -1
	flesh_color =           COLOR_OFF_WHITE

	preview_outfit = null

	base_eye_color = "#ff0000"

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
		/decl/pronouns/male
	)
	available_cultural_info = list(
		TAG_CULTURE = list(/decl/cultural_info/culture/synthetic)
	)
	override_limb_types = list(BP_HEAD = /obj/item/organ/external/head/replika)
	has_organ = list(
		BP_POSIBRAIN = /obj/item/organ/internal/posibrain/replika,
		BP_EYES =      /obj/item/organ/internal/eyes/robot/replika,
		BP_CELL =      /obj/item/organ/internal/cell,
		BP_HEART =     /obj/item/organ/internal/heart,
		BP_STOMACH =   /obj/item/organ/internal/stomach,
	)

	exertion_effect_chance = 10
	exertion_charge_scale = 1
	exertion_emotes_synthetic = list(
		/decl/emote/exertion/synthetic,
		/decl/emote/exertion/synthetic/creak
	)

	hud_type = /datum/hud_data/replika

	traits = list(/decl/trait/biosynthetic_healing = TRAIT_LEVEL_EXISTS)

/obj/item/organ/internal/posibrain/replika
	name = "neural matrix"
	parent_organ = BP_HEAD

/obj/item/organ/internal/eyes/robot/replika
	icon = 'icons/obj/surgery.dmi'
	icon_state = "eyes-prosthetic"
	alive_icon = "eyes-prosthetic"
	dead_icon = "eyes-prosthetic"
	prosthetic_icon = "eyes-prosthetic"
	prosthetic_dead_icon = "eyes-prosthetic"

/obj/item/organ/external/head/replika
	glowing_eyes = TRUE

/decl/species/replika/set_default_hair(mob/living/carbon/human/organism, override_existing = TRUE, defer_update_hair = FALSE)
	if(!istype(organism.bodytype, /decl/bodytype/replika))
		return
	var/decl/bodytype/replika/replika_model = organism.bodytype
	if(!organism.h_style || (override_existing && (organism.h_style != replika_model.default_hair_style)))
		organism.h_style = replika_model.default_hair_style
		if(!defer_update_hair)
			organism.update_hair()
		return TRUE

/decl/species/replika/apply_species_organ_modifications(obj/item/organ/organ)
	..()
	if(istype(organ.bodytype, /decl/bodytype/replika))
		var/decl/bodytype/replika/replika_model = organ.bodytype
		replika_model.apply_model_organ_modifications(organ)

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