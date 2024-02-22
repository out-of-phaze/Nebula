/datum/extension/storage/wallet
	max_w_class = ITEM_SIZE_SMALL //Don't worry, see can_hold[]
	max_storage_space = 8
	can_hold = list(
		/obj/item/cash,
		/obj/item/card,
		/obj/item/clothing/mask/smokable,
		/obj/item/cosmetics,
		/obj/item/grooming,
		/obj/item/mirror,
		/obj/item/clothing/accessory/locket,
		/obj/item/clothing/head/hairflower,
		/obj/item/flashlight/pen,
		/obj/item/flashlight,
		/obj/item/seeds,
		/obj/item/coin,
		/obj/item/dice,
		/obj/item/disk,
		/obj/item/implant,
		/obj/item/implanter,
		/obj/item/flame,
		/obj/item/paper,
		/obj/item/paper_bundle,
		/obj/item/passport,
		/obj/item/pen,
		/obj/item/photo,
		/obj/item/chems/dropper,
		/obj/item/chems/syringe,
		/obj/item/chems/pill,
		/obj/item/chems/hypospray/autoinjector,
		/obj/item/chems/glass/beaker/vial,
		/obj/item/radio/headset,
		/obj/item/paicard,
		/obj/item/stamp,
		/obj/item/key,
		/obj/item/clothing/accessory/badge,
		/obj/item/clothing/accessory/medal,
		/obj/item/clothing/accessory/armor/tag,
	)

/datum/extension/storage/wallet/remove_from_storage(obj/item/W, atom/new_location)
	. = ..(W, new_location)
	if(. && istype(holder, /obj/item/storage/wallet))
		var/obj/item/storage/wallet/wallet = holder
		if(W == wallet.front_id)
			wallet.front_id = null
			wallet.SetName(initial(wallet.name))
			wallet.update_icon()
		if(W == wallet.front_stick)
			wallet.front_stick = null

/datum/extension/storage/wallet/handle_item_insertion(obj/item/W, prevent_warning = 0)
	. = ..(W, prevent_warning)
	if(. && istype(holder, /obj/item/storage/wallet))
		var/obj/item/storage/wallet/wallet = holder
		if(!wallet.front_id && istype(W, /obj/item/card/id))
			wallet.front_id = W
			wallet.update_icon()
		if(!wallet.front_stick && istype(W, /obj/item/charge_stick))
			wallet.front_stick = W
