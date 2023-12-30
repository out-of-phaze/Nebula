/mob/living/carbon/human/proc/update_eyes(update_icons = TRUE)
	var/obj/item/organ/internal/eyes/eyes = get_organ((get_bodytype()?.vision_organ || BP_EYES), /obj/item/organ/internal/eyes)
	if(eyes)
		eyes.update_colour()
		if(update_icons)
			queue_icon_update()

/mob/living/carbon/human/proc/get_bodypart_name(var/zone)
	var/obj/item/organ/external/E = GET_EXTERNAL_ORGAN(src, zone)
	return E?.name

/mob/living/carbon/human/proc/should_recheck_bad_external_organs()
	var/damage_this_tick = get_damage(TOX)
	for(var/obj/item/organ/external/O in get_external_organs())
		damage_this_tick += O.burn_dam + O.brute_dam

	if(damage_this_tick > last_dam)
		. = TRUE
	last_dam = damage_this_tick

/mob/living/carbon/human/proc/recheck_bad_external_organs()
	LAZYCLEARLIST(bad_external_organs)
	for(var/obj/item/organ/external/E in get_external_organs())
		if(E.need_process())
			LAZYDISTINCTADD(bad_external_organs, E)

// Takes care of organ related updates, such as broken and missing limbs
/mob/living/carbon/human/proc/handle_organs()

	// Check for the presence (or lack of) vital organs like the brain.
	// Set a timer after this point, since we want a little bit of
	// wiggle room before the body dies for good (brain transplants).
	if(stat != DEAD)
		var/decl/bodytype/root_bodytype = get_bodytype()
		if(root_bodytype.check_vital_organ_missing(src))
			SET_STATUS_MAX(src, STAT_PARA, 5)
			if(vital_organ_missing_time)
				if(world.time >= vital_organ_missing_time)
					death()
			else
				vital_organ_missing_time = world.time + root_bodytype.vital_organ_failure_death_delay
		else
			vital_organ_missing_time = null



	//processing internal organs is pretty cheap, do that first.
	for(var/obj/item/organ/I in internal_organs)
		I.Process()

	var/force_process = should_recheck_bad_external_organs()

	if(force_process)
		recheck_bad_external_organs()
		for(var/obj/item/organ/external/Ex in get_external_organs())
			LAZYDISTINCTADD(bad_external_organs, Ex)

	handle_stance()
	handle_grasp()

	if(!force_process && !LAZYLEN(bad_external_organs))
		return

	for(var/obj/item/organ/external/E in bad_external_organs)
		if(!E)
			continue
		if(!E.need_process())
			LAZYREMOVE(bad_external_organs, E)
			continue
		else
			E.Process()

			if (!lying && !buckled && world.time - l_move_time < 15)
			//Moving around with fractured ribs won't do you any good
				if (prob(10) && !stat && can_feel_pain() && GET_CHEMICAL_EFFECT(src, CE_PAINKILLER) < 50 && E.is_broken() && LAZYLEN(E.internal_organs))
					custom_pain("Pain jolts through your broken [E.encased ? E.encased : E.name], staggering you!", 50, affecting = E)
					drop_held_items()
					SET_STATUS_MAX(src, STAT_STUN, 2)

				//Moving makes open wounds get infected much faster
				for(var/datum/wound/W in E.wounds)
					if (W.infection_check())
						W.germ_level += 1

/mob/living/carbon/human/proc/Check_Proppable_Object()
	for(var/turf/T in RANGE_TURFS(src, 1)) //we only care for non-space turfs
		if(T.density && T.simulated)	//walls work
			return 1

	for(var/obj/O in orange(1, src))
		if(O && O.density && O.anchored)
			return 1

	return 0

#define LIMB_UNUSABLE 2
#define LIMB_DAMAGED  1
#define LIMB_IMPAIRED 0.5

/mob/living/carbon/human/proc/handle_stance()
	set waitfor = FALSE // Can sleep in emotes.
	// Don't need to process any of this if they aren't standing anyways
	// unless their stance is damaged, and we want to check if they should stay down
	if (!stance_damage && (lying || resting) && (life_tick % 4) != 0)
		return

	stance_damage = 0

	// Buckled to a bed/chair. Stance damage is forced to 0 since they're sitting on something solid
	if (istype(buckled, /obj/structure/bed))
		return

	// Can't fall if nothing pulls you down
	if(!has_gravity())
		return

	// If we don't have a bodytype, all the limb checking below is going to be nonsensical.
	var/decl/bodytype/root_bodytype = get_bodytype()
	if(!root_bodytype)
		return

	var/static/list/all_stance_limbs = list(ORGAN_CATEGORY_STANCE, ORGAN_CATEGORY_STANCE_ROOT)
	var/expected_limbs_for_bodytype = root_bodytype.get_expected_organ_count_for_categories(all_stance_limbs)
	if(expected_limbs_for_bodytype <= 0)
		return // we don't care about stance for whatever reason.

	// Is there something in our loc we can prop ourselves on?
	if(length(loc?.contents))
		for(var/obj/thing in loc.contents)
			if(thing.obj_flags & OBJ_FLAG_SUPPORT_MOB)
				return

	var/had_limb_pain = FALSE
	for(var/obj/item/organ/external/limb in get_organs_by_categories(all_stance_limbs))
		var/add_stance_damage = 0
		if(limb.is_malfunctioning())
			// malfunctioning only happens intermittently so treat it as a missing limb when it procs
			add_stance_damage = LIMB_UNUSABLE
			if(prob(10))
				visible_message("\The [src]'s [limb.name] [pick("twitches", "shudders")] and sparks!")
				spark_at(src, amount = 5, holder = src)
		else if(!limb.is_usable())
			add_stance_damage = LIMB_UNUSABLE
		else if (limb.is_broken())
			add_stance_damage = LIMB_DAMAGED
		else if (limb.is_dislocated())
			add_stance_damage = LIMB_IMPAIRED

		if(add_stance_damage > 0)
			// Keep track of if any of our limbs can feel pain and has failed,
			// so we don't scream if it's a prosthetic that has broken.
			had_limb_pain = had_limb_pain || limb.can_feel_pain()
			stance_damage += add_stance_damage

	// Canes and crutches help you stand (if the latter is ever added)
	// One cane mitigates a broken leg+foot, or a missing foot.
	// Two canes are needed for a lost leg. If you are missing both legs, canes aren't gonna help you.
	for(var/obj/item/cane/C in get_held_items())
		stance_damage -= LIMB_UNUSABLE // Counts for a single functional limb.

	if(MOVING_DELIBERATELY(src)) //you don't suffer as much if you aren't trying to run

		// Calculate the expected and actual number of functioning legs we have.
		var/has_sufficient_working_legs = TRUE
		var/list/root_limb_tags  = root_bodytype.organ_tags_by_category[ORGAN_CATEGORY_STANCE_ROOT]
		var/minimum_working_legs = CEILING(length(root_limb_tags) * 0.5)
		if(minimum_working_legs > 0)
			has_sufficient_working_legs = 0
			for(var/organ_tag in root_limb_tags)
				var/obj/item/organ/external/stance_root = GET_EXTERNAL_ORGAN(src, organ_tag)
				if(!stance_root || !stance_root.is_usable())
					continue
				if(!length(stance_root.children))
					continue
				// In theory a leg may have multiple children in the future; this
				// will need to be revisited for fork-legged insect people or whatever.
				var/has_usable_child = FALSE
				for(var/child_tag in stance_root.children)
					var/obj/item/organ/external/stance_child = GET_EXTERNAL_ORGAN(src, child_tag)
					if(stance_child?.is_usable())
						has_usable_child = TRUE
						break
				if(has_usable_child)
					has_sufficient_working_legs++
					if(has_sufficient_working_legs >= minimum_working_legs)
						has_sufficient_working_legs = TRUE
						break

		// Having half or more of our expected number of working legs allows us to mitigate some stance damage.
		if(has_sufficient_working_legs)
			if(Check_Proppable_Object()) //it helps to lean on something if you've got another leg to stand on
				stance_damage -= LIMB_UNUSABLE
			else
				stance_damage -= LIMB_DAMAGED

	// standing is poor
	if(stance_damage >= expected_limbs_for_bodytype || (stance_damage >= (expected_limbs_for_bodytype*0.75) && prob(8)) || (stance_damage >= (expected_limbs_for_bodytype*0.5) && prob(2)))
		if(!(lying || resting))
			if(had_limb_pain)
				emote(/decl/emote/audible/scream)
			custom_emote(VISIBLE_MESSAGE, "collapses!")
		SET_STATUS_MAX(src, STAT_WEAK, 3) //can't emote while weakened, apparently.

/mob/living/carbon/human/proc/handle_grasp()
	for(var/hand_slot in get_held_item_slots())
		var/datum/inventory_slot/inv_slot = get_inventory_slot_datum(hand_slot)
		if(!inv_slot?.requires_organ_tag)
			continue
		var/holding = inv_slot?.get_equipped_item()
		if(holding)
			var/obj/item/organ/external/E = GET_EXTERNAL_ORGAN(src, inv_slot.requires_organ_tag)
			if((!E || !E.is_usable() || E.is_parent_dislocated()) && try_unequip(holding))
				grasp_damage_disarm(E)

/mob/living/carbon/human/proc/stance_damage_prone(var/obj/item/organ/external/affected)

	if(affected && (!BP_IS_PROSTHETIC(affected) || affected.is_robotic()))
		switch(affected.body_part)
			if(SLOT_FOOT_LEFT, SLOT_FOOT_RIGHT)
				if(!BP_IS_PROSTHETIC(affected))
					to_chat(src, SPAN_WARNING("You lose your footing as your [affected.name] spasms!"))
				else
					to_chat(src, SPAN_WARNING("You lose your footing as your [affected.name] [pick("twitches", "shudders")]!"))
			if(SLOT_LEG_LEFT, SLOT_LEG_RIGHT)
				if(!BP_IS_PROSTHETIC(affected))
					to_chat(src, SPAN_WARNING("Your [affected.name] buckles from the shock!"))
				else
					to_chat(src, SPAN_WARNING("You lose your balance as [affected.name] [pick("malfunctions", "freezes","shudders")]!"))
			else
				return
	SET_STATUS_MAX(src, STAT_WEAK, 4)

/mob/living/carbon/human/proc/grasp_damage_disarm(var/obj/item/organ/external/affected)

	var/list/drop_held_item_slots
	if(istype(affected))
		for(var/grasp_tag in (list(affected.organ_tag) | affected.children))
			var/datum/inventory_slot/inv_slot = get_inventory_slot_datum(grasp_tag)
			if(inv_slot?.get_equipped_item())
				LAZYDISTINCTADD(drop_held_item_slots, inv_slot)
	else if(istype(affected, /datum/inventory_slot))
		drop_held_item_slots = list(affected)

	if(!LAZYLEN(drop_held_item_slots))
		return

	for(var/datum/inventory_slot/inv_slot in drop_held_item_slots)
		if(!try_unequip(inv_slot.get_equipped_item()))
			continue
		var/obj/item/organ/external/E = GET_EXTERNAL_ORGAN(src, inv_slot.slot_id)
		if(!E)
			continue
		if(E.is_robotic())
			var/decl/pronouns/G = get_pronouns()
			visible_message("<B>\The [src]</B> drops what [G.he] [G.is] holding, [G.his] [E.name] malfunctioning!")
			spark_at(src, 5, holder=src)
			continue

		var/grasp_name = E.name
		if((E.body_part in list(SLOT_ARM_LEFT, SLOT_ARM_RIGHT)) && LAZYLEN(E.children))
			var/obj/item/organ/external/hand = pick(E.children)
			grasp_name = hand.name

		if(E.can_feel_pain())
			var/emote_scream = pick("screams in pain", "lets out a sharp cry", "cries out")
			var/emote_scream_alt = pick("scream in pain", "let out a sharp cry", "cry out")
			visible_message(
				"<B>\The [src]</B> [emote_scream] and drops what they were holding in their [grasp_name]!",
				null,
				"You hear someone [emote_scream_alt]!"
			)
			custom_pain("The sharp pain in your [E.name] forces you to drop what you were holding in your [grasp_name]!", 30)
		else
			visible_message("<B>\The [src]</B> drops what they were holding in their [grasp_name]!")

/mob/living/proc/is_asystole()
	return FALSE

/mob/living/carbon/human/is_asystole()
	if(isSynthetic())
		var/obj/item/organ/internal/cell/C = get_organ(BP_CELL, /obj/item/organ/internal/cell)
		if(!C || !C.is_usable() || !C.percent())
			return TRUE
	else if(should_have_organ(BP_HEART))
		var/obj/item/organ/internal/heart/heart = get_organ(BP_HEART, /obj/item/organ/internal/heart)
		if(!istype(heart) || !heart.is_working())
			return TRUE
	return FALSE

//Registers an organ and setup the organ hierachy properly.
//affected  : Parent organ if applicable.
//in_place  : If true, we're performing an in-place replacement, without triggering anything related to adding the organ in-game as part of surgery or else.
/mob/living/carbon/human/add_organ(obj/item/organ/O, obj/item/organ/external/affected, in_place, update_icon, detached, skip_health_update = FALSE)
	if(!(. = ..()))
		return
	if(!O.is_internal())
		refresh_modular_limb_verbs()

	//#TODO: wish we could invalidate the human icons to trigger a single update when the organ state changes multiple times in a row
	if(update_icon)
		update_inhand_overlays(FALSE)
		update_body(FALSE)
		update_bandages(FALSE)
		update_damage_overlays(FALSE)
		hud_reset()
		queue_icon_update() //Avoids calling icon updates 50 times when adding multiple organs

//Unregister and remove a given organ from the mob.
//drop_organ     : Once the organ is removed its dropped to the ground.
//detach         : Toggle the ORGAN_CUT_AWAY flag on the removed organ
//ignore_children: Skips recursively removing this organ's child organs.
//in_place       : If true we remove only the organ (no children items or implants) and avoid triggering mob changes and parent organs changes as much as possible.
//  Meant to be used for init and species transforms, without triggering any updates to mob state or anything related to losing a limb as part of surgery or combat.
/mob/living/carbon/human/remove_organ(obj/item/organ/O, drop_organ, detach, ignore_children,  in_place, update_icon, skip_health_update = FALSE)
	if(!(. = ..()))
		return
	if(!O.is_internal())
		refresh_modular_limb_verbs()
		LAZYREMOVE(bad_external_organs, O)

	//#TODO: wish we could invalidate the human icons to trigger a single update when the organ state changes multiple times in a row
	if(update_icon)
		regenerate_body_icon = TRUE
		hud_reset()
		queue_icon_update() //Avoids calling icon updates 50 times when removing multiple organs

/mob/living/carbon/human/on_lost_organ(var/obj/item/organ/O)
	if(!(. = ..()))
		return
	//Move some blood over to the organ
	if(!BP_IS_PROSTHETIC(O) && O.species && O.reagents?.total_volume < 5)
		vessel.trans_to(O, 5 - O.reagents.total_volume, 1, 1)

/mob/living/carbon/human/delete_organs()
	. = ..()
	LAZYCLEARLIST(bad_external_organs)
