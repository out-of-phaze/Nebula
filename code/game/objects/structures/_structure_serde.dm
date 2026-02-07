/obj/structure/Serialize()
	. = ..()
	// paint_verb is autoset if null; if it's autoset, don't bother serializing it
	if(!isnull(initial(paint_verb)) || !(paint_verb == "painted" || (material && paint_verb == material.paint_verb)))
		SERIALIZE_IF_MODIFIED(paint_verb, /obj/structure)

// TODO: someone please come up with a better way to conditionally skip vars in serialization other than unsetting and re-setting them
/*
/obj/structure/Serialize()
	var/old_max_health
	if(material && max_health == get_expected_max_health())
		old_max_health = max_health
		max_health = initial(max_health) // don't save
	. = ..()
	if(old_max_health)
		max_health = old_max_health
*/

/obj/structure
	__has_post_serialize = TRUE

// removing max_health this way means we don't mess with current_health serialization
/obj/structure/PostSerialize(list/serialized_data)
	. = ..()
	if(material && max_health == get_expected_max_health())
		. -= nameof(/atom::max_health) // remove the max_health key from the list