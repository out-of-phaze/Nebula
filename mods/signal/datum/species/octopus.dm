/datum/appearance_descriptor/age/octopus
	chargen_min_index = 3
	chargen_max_index = 5
	standalone_value_descriptors = list(
		"freshly hatched" =      1,
		"a larva" =              2,
		"a juvenile" =           5,
		"a young adult" =       10,
		"an adult" =            15,
		"approaching old age" = 30,
		"senescent" =           40
	)

/decl/blood_type/octopus
	name = "hemocyanin"
	splatter_colour = "#68a6dd"
	splatter_name =   "hemocyanin"
	splatter_desc =   "It's some hemocyanin. That's not supposed to be there."
	antigens = list("Hc")
	antigen_category = SPECIES_OCTOPUS

/decl/species/octopus
	name = SPECIES_OCTOPUS
	name_plural = "Octopodes"
	description = "Octopus uplifts have been a relatively common sight in aquatic environments since the early days of \
	Sol expansion. The are renowned as excellent engineers, bartenders, and massage therapists."
	available_bodytypes = list(/decl/bodytype/octopus)
	meat_type = /obj/item/chems/food/fish/octopus
	age_descriptor = /datum/appearance_descriptor/age/octopus
	slowdown = 2
	unarmed_attacks = list(
		/decl/natural_attack/punch/tentacle, 
		/decl/natural_attack/bite
	)

	blood_types = list(/decl/blood_type/octopus)
	flesh_color = "#dd7b68"

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_SLIP
	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_SKIN_COLOR | HAS_EYE_COLOR

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart/octopus,
		BP_LUNGS =    /obj/item/organ/internal/lungs/octopus,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes/octopus,
		)

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/unbreakable/octopus),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/unbreakable),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/unbreakable/octopus),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/unbreakable/octopus),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/unbreakable/octopus),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/unbreakable/octopus),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/unbreakable/octopus),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/unbreakable/octopus),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/unbreakable/octopus),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/unbreakable/octopus),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/unbreakable/octopus)
		)

	hud_type = /datum/hud_data/octopus

	var/list/camo_last_move_by_mob = list()
	var/list/camo_last_alpha_by_mob = list()
	var/const/camo_delay = 10 SECONDS
	var/const/camo_alpha_step = 10
	var/const/camo_min_alpha = 40

/decl/species/octopus/handle_death(var/mob/living/carbon/human/H)
	update_mob_alpha(H, 255)

/decl/species/octopus/proc/update_mob_alpha(var/mob/living/carbon/human/H, var/newval = 255)
	if(camo_last_alpha_by_mob[H] == newval)
		return
	camo_last_alpha_by_mob[H] = newval
	var/need_update
	for(var/thing in H.get_organs())
		var/obj/item/organ/external/limb = thing
		if(!BP_IS_PROSTHETIC(limb) && limb.species == src && limb.render_alpha != newval)
			limb.render_alpha = newval
			need_update = 1
	if(need_update)
		H.update_body()

/decl/species/octopus/handle_post_spawn(var/mob/living/carbon/H)
	. = ..()
	camo_last_alpha_by_mob[H] = 255
	camo_last_move_by_mob[H] = world.time

/decl/species/octopus/get_slowdown(var/mob/living/carbon/human/H)
	return (H && H.loc && H.loc.is_flooded() ? -1 : slowdown)

/decl/species/octopus/handle_post_move(var/mob/living/carbon/human/H)
	..()
	camo_last_move_by_mob[H] = world.time
	update_mob_alpha(H, min(camo_last_alpha_by_mob[H] + camo_min_alpha, 255))

/decl/species/octopus/handle_environment_special(var/mob/living/carbon/human/H)
	var/last_alpha = camo_last_alpha_by_mob[H]
	if(world.time >= camo_last_move_by_mob[H]+camo_delay && last_alpha > camo_min_alpha)
		update_mob_alpha(H, max(camo_min_alpha, last_alpha-camo_alpha_step))

/datum/hud_data/octopus
	gear = list(
		"i_clothing" =   list("loc" = ui_iclothing, "name" = "Uniform",      "slot" = slot_w_uniform_str, "state" = "center", "toggle" = 1),
		"o_clothing" =   list("loc" = ui_mask,      "name" = "Suit",         "slot" = slot_wear_suit_str, "state" = "suit",   "toggle" = 1),
		"eyes" =         list("loc" = ui_glasses,   "name" = "Glasses",      "slot" = slot_glasses_str,   "state" = "glasses","toggle" = 1),
		"head" =         list("loc" = ui_head,      "name" = "Hat",          "slot" = slot_head_str,      "state" = "hair",   "toggle" = 1),
		"suit storage" = list("loc" = ui_sstore1,   "name" = "Suit Storage", "slot" = slot_s_store_str,   "state" = "suitstore"),
		"back" =         list("loc" = ui_back,      "name" = "Back",         "slot" = slot_back_str,      "state" = "back"),
		"id" =           list("loc" = ui_id,        "name" = "ID",           "slot" = slot_wear_id_str,   "state" = "id"),
		"storage1" =     list("loc" = ui_storage1,  "name" = "Left Pocket",  "slot" = slot_l_store_str,   "state" = "pocket"),
		"storage2" =     list("loc" = ui_storage2,  "name" = "Right Pocket", "slot" = slot_r_store_str,   "state" = "pocket"),
		"belt" =         list("loc" = ui_belt,      "name" = "Belt",         "slot" = slot_belt_str,      "state" = "belt")
		)

/decl/natural_attack/punch/tentacle
	attack_verb = list("smacked", "slapped", "swiped")
	attack_noun = list("tentacle")
	eye_attack_text = "tentacle"
	eye_attack_text_victim = "tentacles"

/obj/item/organ/internal/heart/octopus
	name = "hearts"
	gender = PLURAL

/obj/item/organ/internal/lungs/octopus
	name = "funnel"
	gender = NEUTER
	has_gills = TRUE

/obj/item/organ/internal/lungs/octopus/can_drown()
	return FALSE

/obj/item/organ/internal/lungs/aquatic
	has_gills = TRUE

/obj/item/organ/internal/lungs/aquatic/can_drown()
	return FALSE

/obj/item/organ/internal/eyes/octopus
	eye_icon = 'mods/signal/icons/species/octopus/eyes.dmi'

/obj/item/organ/external/head/unbreakable/octopus
	joint = "spine"
	amputation_point = "neck"
	encased = null

/obj/item/organ/external/chest/unbreakable/octopus
	encased = null

/obj/item/organ/external/arm/unbreakable/octopus
	name = "first tentacle"
	joint = "base"
	amputation_point = "base"

/obj/item/organ/external/arm/right/unbreakable/octopus
	name = "second tentacle"
	joint = "base"
	amputation_point = "base"

/obj/item/organ/external/leg/unbreakable/octopus
	name = "third tentacle"
	joint = "base"
	amputation_point = "base"

/obj/item/organ/external/leg/right/unbreakable/octopus
	name = "fourth tentacle"
	joint = "base"
	amputation_point = "base"

/obj/item/organ/external/hand/unbreakable/octopus
	name = "fifth tentacle"
	joint = "base"
	amputation_point = "base"

/obj/item/organ/external/hand/right/unbreakable/octopus
	name = "sixth tentacle"
	joint = "base"
	amputation_point = "base"

/obj/item/organ/external/foot/unbreakable/octopus
	name = "seventh tentacle"
	joint = "base"
	amputation_point = "base"

/obj/item/organ/external/foot/right/unbreakable/octopus
	name = "eigth tentacle"
	joint = "base"
	amputation_point = "base"

/decl/bodytype/octopus
	name =              "octopode"
	bodytype_category = BODYTYPE_OCTOPUS
	icon_base =         'mods/signal/icons/species/octopus/body.dmi'
	icon_deformed =     'mods/signal/icons/species/octopus/body.dmi'
	icon_template =     'mods/signal/icons/species/octopus/template.dmi'
	damage_overlays =   'mods/signal/icons/masks/dam_octopus.dmi'
