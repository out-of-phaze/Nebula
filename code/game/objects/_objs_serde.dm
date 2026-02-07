// TODO: a less hacky way to skip reagent serialization than unsetting it
// we could remove the keys in PostSerialize but that would mean we waste time serializing it only to remove it
/obj/Serialize()
	var/datum/reagents/old_reagents // to restore reagents after serialize
	// preprocessing reagents to avoid unnecessary serialization of default contents
	if(istype(reagents) && !REAGENT_TOTAL_VOLUME(reagents) && (chem_volume > 0) && REAGENT_MAXIMUM_VOLUME(reagents) == chem_volume)
		old_reagents = reagents // don't serialize reagents if we're empty and were auto-created due to chem_volume
		reagents = null
	. = ..()
	SERIALIZE_IF_MODIFIED(w_class, /obj)
	if(old_reagents)
		reagents = old_reagents
