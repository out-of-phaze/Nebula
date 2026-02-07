/obj/item/trash/Serialize()
	. = ..()
	SERIALIZE_IF_MODIFIED(age, /obj/item/trash)

/obj/item/trash/ShouldSerialize(_age)
	return ..() && (isnull(_age) || age < _age)

/obj/item/trash/Deserialize(list/instance_map)
	..()
	return SERDE_HINT_POSTINIT

/obj/item/trash/DeserializePostInit(list/instance_map)
	. = ..()
	var/too_much_trash = -1 // -1 to offset src
	for(var/obj/item/trash/thing in loc)
		too_much_trash++
		if(thing != src && thing.type == type)
			qdel(src)
			return
	if(too_much_trash >= 5)
		qdel(src)
		return
