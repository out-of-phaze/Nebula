var/global/const/DATA_BLENDED = /decl/reagent_data_field/blended

/decl/reagent_data_field/blended
	uid = "rdf_karmotrine_blended"

/decl/cocktail/get_additional_guide_text()
	if(blended)
		LAZYADD(., "Blend until smooth.")
	else if(!order_specific)
		LAZYADD(., "Mix thoroughly.")
	if((/decl/material/solid/ice in display_ratios) && !isnum(display_ratios[/decl/material/solid/ice])) // ice to taste
		LAZYADD(., "Serve over ice.")

/decl/cocktail/get_additional_mechanics_text()
	if(blended)
		LAZYADD(., "All blended.")
	else if(!order_specific)
		LAZYADD(., "All mixed.")
	if((/decl/material/solid/ice in display_ratios) && !isnum(display_ratios[/decl/material/solid/ice])) // ice to taste
		LAZYADD(., "On the rocks.")

/obj/machinery/reagentgrinder/juicer/end_grind(mob/user)
	. = ..()
	if(!LAZYLEN(REAGENT_VOLUMES(beaker?.reagents)))
		return
	var/is_blended = FALSE
	// give all the cocktail chemicals in the beaker the 'blended' data
	for(var/chem_path in REAGENT_VOLUMES(beaker.reagents))
		if (!ispath(chem_path, /decl/material/liquid/blendable))
			continue
		REAGENT_SET_DATA(beaker.reagents, chem_path, list((DATA_BLENDED) = TRUE))
		is_blended = TRUE
	if(is_blended)
		visible_message(SPAN_NOTICE("The contents of \the [beaker] settle into a fine liquid."))

/decl/material/liquid/blendable
	abstract_type = /decl/material/liquid/blendable

// mix_data isn't called without initial data, so we set it to false here
/decl/material/liquid/blendable/initialize_data(var/newdata)
	. = ..() || list()
	.[DATA_BLENDED] ||= FALSE

/decl/material/liquid/blendable/mix_data(var/datum/reagents/reagents, var/list/newdata, var/amount)
	. = ..()
	if(LAZYACCESS(., DATA_BLENDED) && !LAZYACCESS(newdata, DATA_BLENDED)) // have to re-blend if you add unblended reagents
		.[DATA_BLENDED] = FALSE

/decl/cocktail
	var/blended = FALSE /// if TRUE, checks for BLENDED in reagent data during matches()

/decl/cocktail/matches(obj/item/prop)
	if(!(. = ..()))
		return
	if(!blended)
		return
	var/is_blended = FALSE
	for(var/chem_path in REAGENT_VOLUMES(prop.reagents))
		if (!ispath(chem_path, /decl/material/liquid/blendable))
			continue
		var/list/data = REAGENT_DATA(prop.reagents, chem_path)
		if(!LAZYACCESS(data, DATA_BLENDED))
			return FALSE
		is_blended = TRUE
	if(!is_blended)
		CRASH("Cocktail [src.name] ([src.type]) has blended set but has no blendable ingredients!")
	return TRUE