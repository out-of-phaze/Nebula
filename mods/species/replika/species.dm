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

/datum/hud_data/replika
	gear = list(
		"o_clothing" =   list("loc" = ui_oclothing, "name" = "Suit",         "slot" = slot_wear_suit_str, "state" = "suit",   "toggle" = 1),
		"mask" =         list("loc" = ui_mask,      "name" = "Mask",         "slot" = slot_wear_mask_str, "state" = "mask",   "toggle" = 1),
		"gloves" =       list("loc" = ui_gloves,    "name" = "Gloves",       "slot" = slot_gloves_str,    "state" = "gloves", "toggle" = 1),
		"eyes" =         list("loc" = ui_glasses,   "name" = "Glasses",      "slot" = slot_glasses_str,   "state" = "glasses","toggle" = 1),
		"l_ear" =        list("loc" = ui_l_ear,     "name" = "Left Ear",     "slot" = slot_l_ear_str,     "state" = "ears",   "toggle" = 1),
		"r_ear" =        list("loc" = ui_r_ear,     "name" = "Right Ear",    "slot" = slot_r_ear_str,     "state" = "ears",   "toggle" = 1),
		"head" =         list("loc" = ui_head,      "name" = "Hat",          "slot" = slot_head_str,      "state" = "hair",   "toggle" = 1),
		"suit storage" = list("loc" = ui_sstore1,   "name" = "Suit Storage", "slot" = slot_s_store_str,   "state" = "suitstore"),
		"back" =         list("loc" = ui_back,      "name" = "Back",         "slot" = slot_back_str,      "state" = "back"),
		"id" =           list("loc" = ui_id,        "name" = "ID",           "slot" = slot_wear_id_str,   "state" = "id"),
		"storage1" =     list("loc" = ui_storage1,  "name" = "Left Pocket",  "slot" = slot_l_store_str,   "state" = "pocket"),
		"storage2" =     list("loc" = ui_storage2,  "name" = "Right Pocket", "slot" = slot_r_store_str,   "state" = "pocket"),
		"belt" =         list("loc" = ui_belt,      "name" = "Belt",         "slot" = slot_belt_str,      "state" = "belt")
		)