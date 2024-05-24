/obj/item/chems/repair_spray
	name = "repair spray"
	desc = "A single-use spray gun to fill damaged areas with polyurethane-based expanding foam."
	icon = 'mods/species/replika/icons/repair_spray.dmi'
	item_flags = ITEM_FLAG_NO_BLUDGEON
	w_class = ITEM_SIZE_SMALL
	volume = 20 // needs room to dump a repair patch into it
	possible_transfer_amounts = @"[5,10,15]"
	var/tmp/sound_spray = 'sound/effects/spray.ogg' ///Sound played when spraying

/obj/item/chems/repair_spray/examine(mob/user, distance, infix, suffix)
	. = ..()
	if(distance <= 2)
		to_chat(user, SPAN_NOTICE("\The [src]'s refill cap is [ATOM_IS_OPEN_CONTAINER(src) ? "open" : "closed"]."))

/obj/item/chems/repair_spray/attack_self(mob/user)
	to_chat(user, SPAN_WARNING("You [ATOM_IS_OPEN_CONTAINER(src) ? "close" : "open"] \the [src]'s refill cap!"))
	atom_flags ^= ATOM_FLAG_OPEN_CONTAINER

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

// TODO: Greyscale and add paint sprayer support
// This is really bad and I don't like it :(
/obj/item/chems/repair_spray/on_update_icon()
	. = ..()
	if(!reagents?.total_volume) // keep whatever we had last
		return
	if(reagents.primary_reagent == /decl/material/solid/plastifoam/quick)
		icon = 'mods/species/replika/icons/repair_spray+.dmi'
	else if (reagents.primary_reagent == /decl/material/solid/plastifoam)
		icon = 'mods/species/replika/icons/repair_spray.dmi'

// i like this even less, maybe just make it always repair spray or have compiled-in repair spray+ objects use a label
// so that we can go with the de-arcadification of requiring a paint sprayer and labeler for them
/obj/item/chems/repair_spray/update_container_name()
	if(!reagents?.total_volume) // keep whatever we had last
		return
	if(reagents.primary_reagent == /decl/material/solid/plastifoam/quick)
		name = "repair spray+"
	else if (reagents.primary_reagent == /decl/material/solid/plastifoam)
		name = "repair spray"

// i have no idea how to de-arcade this. maybe just make it show the lore text of the chem inside? extra labeler functionality? idk
/obj/item/chems/repair_spray/update_container_desc()
	if(!reagents?.total_volume) // keep whatever we had last
		return
	if(reagents.primary_reagent == /decl/material/solid/plastifoam/quick)
		desc = "A single-use spray gun used to fill damaged areas with fast-curing polyurethane-based expanding foam."
	else if (reagents.primary_reagent == /decl/material/solid/plastifoam)
		desc = "A single-use spray gun to fill damaged areas with polyurethane-based expanding foam."

/obj/item/chems/hypospray/autoinjector/klstim
	name = "autoinjector"
	desc = "Autoinjector syringe filled with REPLIKA-KLStim-N stimulant. Quick and easy to use."
	icon = 'mods/species/replika/icons/autoinjector.dmi'
	detail_state = null

/obj/item/chems/hypospray/autoinjector/klstim/populate_reagents()
	. = ..()
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
	material = /decl/material/solid/organic/paper
	atom_flags = 0 // not open, temperature can change
	var/start_sealed = TRUE // if sealed, it must be torn before it can be used

/obj/item/chems/patch/Initialize()
	. = ..()
	if(!start_sealed)
		atom_flags |= ATOM_FLAG_OPEN_CONTAINER

/obj/item/chems/patch/on_update_icon()
	. = ..()
	if(start_sealed && ATOM_IS_OPEN_CONTAINER(src))
		icon_state = "[get_world_inventory_state()]_torn"
	else
		icon_state = get_world_inventory_state()

/obj/item/chems/patch/use_on_mob(mob/living/victim, mob/user)
	if(!ATOM_IS_OPEN_CONTAINER(src))
		to_chat(user, SPAN_NOTICE("You need to open \the [src] first!"))
		return TRUE
	var/obj/item/organ/external/targeted_organ = GET_EXTERNAL_ORGAN(victim, user.zone_sel.selecting || BP_CHEST)
	if(!isliving(victim))
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
		user.visible_message("<b>\The [user]</b> finds a wound on \the [targeted_organ].")

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
	physically_destroyed()
	return TRUE

/obj/item/chems/patch/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!ATOM_IS_OPEN_CONTAINER(src))
		to_chat(user, SPAN_NOTICE("You need to open \the [src] first!"))
		return
	if(!proximity_flag)
		return

	if(standard_dispenser_refill(user, target))
		return TRUE

	if(standard_pour_into(user, target))
		return TRUE

/obj/item/chems/patch/on_reagent_change()
	if(reagents?.total_volume == 0)
		addtimer(CALLBACK(src, /atom/proc/physically_destroyed), 0) // I hate this, but we need it to happen after other procs finish running.
	else
		..()

/obj/item/chems/patch/physically_destroyed(skip_qdel)
	var/turf/our_turf = get_turf(src)
	var/decl/material/mat
	for(var/key in matter)
		mat = GET_DECL(key)
		mat.place_cuttings(our_turf, matter[key] % SHEET_MATERIAL_AMOUNT)
	if(reagents?.total_volume > 0) // destroyed by something other than being used
		reagents.splash_turf(our_turf, reagents.total_volume)
	return ..()

/obj/item/chems/patch/attack_self(mob/user)
	if(!start_sealed)
		return
	if(ATOM_IS_OPEN_CONTAINER(src))
		to_chat(user, SPAN_NOTICE("\The [src] is already open!"))
		return
	to_chat(user, SPAN_WARNING("You tear \the [src] open!"))
	playsound(src, 'sound/items/poster_ripped.ogg', 10)
	atom_flags |= ATOM_FLAG_OPEN_CONTAINER
	update_icon()

/obj/item/chems/patch/repair
	name = "repair patch"
	base_name = "repair patch"
	desc = "A sealed, single-use adhesive patch containing a coagulation agent to patch up damaged areas. \
	Coagulant K stops fluid leaks quickly and reliably by thickening Replika oxidant fluid into a gelatinous mass."

/obj/item/chems/patch/repair/populate_reagents()
	reagents.add_reagent(/decl/material/solid/koagulant_k, reagents.maximum_volume)

/obj/item/box/survival/replika
	name = "\improper Replika repair kit"
	desc = "A box decorated in warning colors that contains a limited supply of Replika repair supplies. The back says 'Im Besitz des Arbeits- und Erziehungsorgan der Nation,' whatever that means."
	icon_state = "survival"

/obj/item/box/survival/replika/WillContain()
	return list(
		/obj/item/chems/patch/repair = 3,
		/obj/item/chems/repair_spray = 2,
		/obj/item/chems/hypospray/autoinjector/klstim = 1
	)

/obj/item/gun/projectile/revolver/einhorn
	name = "\improper Einhorn revolver"
	desc = "The Eu-K508 S 'Einhorn' is a short-barreled double-action 6-shot revolver that fires 12mm high-power ammo. High recoil, strong knockback."
	icon = 'mods/species/replika/icons/weapons/einhorn.dmi'
	safety_icon = null
	caliber = CALIBER_SIGNALIS_REVOLVER
	ammo_type = /obj/item/ammo_casing/pistol/magnum/einhorn

/obj/item/ammo_casing/pistol/magnum/einhorn
	desc = "A high-powered, hollow-tipped 12mm revolver bullet casing."
	caliber = CALIBER_SIGNALIS_REVOLVER
	projectile_type = /obj/item/projectile/bullet/pistol/strong

/obj/item/box/ammo/eimyria
	name = "box of Imperial revolver rounds"
	desc = "Old Imperially-produced 12x40mm hollow-point bullets that deform and fracture on impact for immense impact power. "

/obj/item/box/ammo/eimyria/WillContain()
	return list(/obj/item/ammo_casing/pistol/magnum/einhorn = 18)

/obj/item/ammo_magazine/speedloader/eimyria
	caliber = CALIBER_SIGNALIS_REVOLVER
	ammo_type = /obj/item/ammo_casing/pistol/magnum/einhorn