/obj/item/Serialize()
	. = ..()
	// paint_verb is autoset if null; if it's autoset, don't bother serializing it
	if(!isnull(initial(paint_verb)) || !(paint_verb == "painted" || (material && paint_verb == material.paint_verb)))
		SERIALIZE_IF_MODIFIED(paint_verb, /obj/item)
	if(REAGENT_TOTAL_VOLUME(coating))
		SERIALIZE_REAGENTS(coating, /obj/item, nameof(coating))

/obj/item/Deserialize(list/instance_map)
	. = ..()
	DESERIALIZE_REAGENTS(coating, nameof(coating))