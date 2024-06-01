
/obj/item/arrow
	name = "bolt"
	desc = "It's got a tip for you - get the point?"
	icon = 'icons/obj/items/weapon/crossbow_bolt.dmi'
	icon_state = "bolt"
	item_state = "bolt"
	throwforce = 8
	w_class = ITEM_SIZE_NORMAL
	sharp = 1
	edge = 0
	lock_picking_level = 3
	material = /decl/material/solid/organic/wood

/// Helper for metal rods falling apart.
/obj/item/arrow/proc/removed_from_bow(mob/user)
	return

/obj/item/spike
	name = "alloy spike"
	desc = "It's about a foot of weird silver metal with a wicked point."
	sharp = 1
	edge = 0
	throwforce = 5
	w_class = ITEM_SIZE_SMALL
	icon = 'icons/obj/items/weapon/crossbow_bolt.dmi'
	icon_state = "metal-rod"
	item_state = "bolt"
	material = /decl/material/solid/metal/alienalloy

/obj/item/arrow/rod
	name = "metal rod"
	desc = "Don't cry for me, Orithena."
	icon_state = "metal-rod"
	material = /decl/material/solid/metal/steel

/obj/item/arrow/rod/removed_from_bow(mob/user)
	if(throwforce == 15) // The rod has been superheated - we don't want it to be useable when removed from the bow.
		to_chat(user, SPAN_DANGER("\The [src] shatters into a scattering of overstressed metal shards as it leaves the crossbow."))
		var/obj/item/shard/shrapnel/S = new()
		S.dropInto(loc)
		qdel(src)
