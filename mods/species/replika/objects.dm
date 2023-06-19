/obj/item/chems/repair_spray
	name = "repair spray"
	desc = "A single-use spray gun to fill damaged areas with polyurethane-based expanding foam."
	icon = 'mods/species/replika/icons/repair_spray.dmi'
	item_flags = ITEM_FLAG_NO_BLUDGEON
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	w_class = ITEM_SIZE_SMALL
	volume = 20 // needs room to dump a repair patch into it
	possible_transfer_amounts = @"[5,10,15]"
	var/tmp/sound_spray = 'sound/effects/spray.ogg' ///Sound played when spraying

/obj/item/chems/repair_spray/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!ATOM_IS_OPEN_CONTAINER(src) || !proximity_flag)
		return

	if(standard_dispenser_refill(user, target))
		return TRUE

	if(standard_pour_into(user, target))
		return TRUE

	if(reagents.total_volume < amount_per_transfer_from_this)
		to_chat(user, SPAN_WARNING("\The [src] is empty!"))
		return

	playsound(src, sound_spray, 50, TRUE, -6)

	if (target.density)
		reagents.trans_to(target, amount_per_transfer_from_this)
		if(target == user)
			target.visible_message(SPAN_NOTICE("\The [user] sprays themselves with \the [src]."))
		else
			target.visible_message(SPAN_NOTICE("\The [user] sprays \the [target] with \the [src]."))

/obj/item/chems/repair_spray/populate_reagents()
	reagents.add_reagent(/decl/material/solid/plastifoam, 15)
	return

/obj/item/chems/repair_spray/quick
	name = "repair spray+"
	desc = "A single-use spray gun used to fill damaged areas with fast-curing polyurethane-based expanding foam."
	icon = 'mods/species/replika/icons/repair_spray+.dmi'

/obj/item/chems/repair_spray/quick/populate_reagents()
	reagents.add_reagent(/decl/material/solid/plastifoam/quick, 15)
	return

/obj/item/chems/hypospray/autoinjector/klstim
	name = "autoinjector"
	desc = "Autoinjector syringe filled with REPLIKA-KLStim-N stimulant. Quick and easy to use."
	icon = 'mods/species/replika/icons/autoinjector.dmi'
	detail_state = null

/obj/item/chems/hypospray/autoinjector/klstim/populate_reagents()
	reagents.add_reagent(/decl/material/liquid/klstim_n, reagents.maximum_volume)

/obj/item/chems/patch
	name = "patch"
	base_name = "patch"
	desc = "A reagent-infused patch for topical administration of medicines."
	// todo: inhand sprites?
	icon = 'mods/species/replika/icons/repair_patch.dmi'
	randpixel = 7
	possible_transfer_amounts = null
	w_class = ITEM_SIZE_TINY
	volume = 5
	material = /decl/material/solid/plantmatter

/obj/item/chems/patch/attack(mob/living/carbon/victim, mob/user, def_zone)
	var/obj/item/organ/external/targeted_organ = GET_EXTERNAL_ORGAN(victim, def_zone)
	if(!iscarbon(victim))
		return TRUE
	if(!reagents?.total_volume)
		to_chat(user, SPAN_NOTICE("\The [src] has no medicine in it!"))
	if(!targeted_organ)
		to_chat(user, SPAN_NOTICE("You can't apply \the [src] there, \the [victim] is missing that body part!"))
		return TRUE
	if(targeted_organ.number_wounds <= 0) // search for a wound
		var/wounded_organ_points = 0
		var/max_wounds = 0
		var/list/external_organs = victim.get_external_organs() - targeted_organ
		for(var/obj/item/organ/external/checked_organ in external_organs)
			if(checked_organ.number_wounds > 0)
				var/wound_score = (checked_organ.number_wounds * global.organ_rel_size[checked_organ.organ_tag])
				wounded_organ_points += wound_score
				if(wound_score > max_wounds)
					max_wounds = wound_score
					targeted_organ = checked_organ
		if(wounded_organ_points <= 0)
			to_chat(user, (user == victim) ? SPAN_NOTICE("You have no wounds to treat with \the [src]!") : SPAN_NOTICE("\The [victim] has no wounds to treat with \the [src]!"))
			return TRUE
		// The idea is that the harder it is to find a wound,
		// based on how many wounds there are and where,
		// the longer it takes to apply.
		user.visible_message("<b>\The [user]</b> starts searching \the [victim] for a wound to treat...", SPAN_NOTICE("You start searching \the [victim] for a wound to treat..."))
		var/time_taken = 5 SECONDS - FLOOR(4 SECONDS * (wounded_organ_points / (100 * length(external_organs))))
		if(!do_mob(user, victim, time_taken))
			user.visible_message("<b>\The [user]</b> stops treating \the [victim].", SPAN_NOTICE("You stop treating \the [victim]."))
			return TRUE
		user.visible_message("<b>\The [user] finds a wound on \the [targeted_organ].")

	user.visible_message("<b>\The [user]</b> starts applying \the [src] to \the [victim]'s [targeted_organ.name]...", SPAN_NOTICE("You start applying \the [src] to \the [victim]'s [targeted_organ.name]."))
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	var/decl/pronouns/victim_pronouns = victim.get_pronouns()
	if(!do_mob(user, victim, 0.5 SECONDS))
		if(victim == user)
			user.visible_message("<b>\The [user]</b> decides not to apply \the [src] to [victim_pronouns.self].", SPAN_NOTICE("You decide not to apply \the [src] to yourself."))
		else
			user.visible_message("<b>\The [user]</b> decides not to apply \the [src] to \the [victim].", SPAN_NOTICE("You decide not to apply \the [src] to \the [victim]."))
		return TRUE

	if(victim == user)
		victim.visible_message("<b>\The [victim]</b> applies \the [src] to [victim_pronouns.his] [targeted_organ.name].", SPAN_NOTICE("You apply \the [src] to your [targeted_organ.name]."))
	else
		var/contained = REAGENT_LIST(src)
		admin_attack_log(user, victim, "Dosed the victim with [src] (Reagents: [contained])", "Was dosed with [src] (Reagents: [contained])", "used [src] (Reagents: [contained])")
		victim.visible_message("<b>\The [user]</b> applies \the [src] to \the [victim]'s [targeted_organ.name].", SPAN_NOTICE("You apply \the [src] to \the [victim]'s [targeted_organ.name]."))
	reagents.trans_to_mob(victim, reagents.total_volume, CHEM_TOUCH)
	qdel(src)
	return TRUE

/obj/item/chems/patch/repair
	name = "repair patch"
	base_name = "repair patch"
	desc = "A sealed, single-use adhesive patch containing a coagulation agent to patch up damaged areas. \
	Coagulant K stops fluid leaks quickly and reliably by thickening Replika oxidant fluid into a gelatinous mass."

/obj/item/chems/patch/repair/populate_reagents()
	reagents.add_reagent(/decl/material/solid/koagulant_k, reagents.maximum_volume)

/obj/item/storage/box/survival/replika
	name = "\improper Replika repair kit"
	desc = "A box decorated in warning colors that contains a limited supply of Replika repair supplies. The back says 'Im Besitz des Arbeits- und Erziehungsorgan der Nation,' whatever that means."
	icon_state = "survival"

/obj/item/storage/box/survival/replika/WillContain()
	return list(
		/obj/item/chems/patch/repair = 3,
		/obj/item/chems/repair_spray = 2,
		/obj/item/chems/hypospray/autoinjector/klstim = 1
	)