/proc/wash_mob(var/mob/living/washing)

	if(!istype(washing))
		return

	var/mob/living/L = washing

	if(L.on_fire)
		L.visible_message("<span class='danger'>A cloud of steam rises up as the water hits \the [L]!</span>")
		L.ExtinguishMob()

	L.fire_stacks = -20 //Douse ourselves with water to avoid fire more easily

	if(!iscarbon(washing))
		washing.clean_blood()
		return

	var/mob/living/carbon/M = washing
	for(var/obj/item/thing in M.get_held_items())
		thing.clean_blood()

	var/obj/item/back = M.get_equipped_item(slot_back_str)
	if(back)
		back.clean_blood()

	//flush away reagents on the skin
	var/datum/reagents/touching_reagents = M.get_contact_reagents()
	if(touching_reagents)
		var/remove_amount = touching_reagents.maximum_volume * M.reagent_permeability() //take off your suit first
		touching_reagents.remove_any(remove_amount)

	if(!ishuman(M))
		var/obj/item/mask = M.get_equipped_item(slot_wear_mask_str)
		if(mask)
			mask.clean_blood()
		M.clean_blood()
		return

	var/mob/living/carbon/human/H = M
	var/washgloves = 1
	var/washshoes = 1
	var/washmask = 1
	var/washears = 1
	var/washglasses = 1

	var/obj/item/suit = H.get_equipped_item(slot_wear_suit_str)
	if(suit)
		washgloves = !(suit.flags_inv & HIDEGLOVES)
		washshoes = !(suit.flags_inv & HIDESHOES)

	if(H.head)
		washmask = !(H.head.flags_inv & HIDEMASK)
		washglasses = !(H.head.flags_inv & HIDEEYES)
		washears = !(H.head.flags_inv & HIDEEARS)

	var/obj/item/mask = M.get_equipped_item(slot_wear_mask_str)
	if(mask)
		if (washears)
			washears = !(mask.flags_inv & HIDEEARS)
		if (washglasses)
			washglasses = !(mask.flags_inv & HIDEEYES)

	if(H.head)
		H.head.clean_blood()

	if(suit)
		suit.clean_blood()
	else if(H.w_uniform)
		H.w_uniform.clean_blood()
	if(H.gloves && washgloves)
		H.gloves.clean_blood()
	var/obj/item/shoes = H.get_equipped_item(slot_shoes_str)
	if(shoes && washshoes)
		shoes.clean_blood()
	if(mask && washmask)
		mask.clean_blood()
	if(H.glasses && washglasses)
		H.glasses.clean_blood()
	if(H.l_ear && washears)
		H.l_ear.clean_blood()
	if(H.r_ear && washears)
		H.r_ear.clean_blood()
	if(H.belt)
		H.belt.clean_blood()
	H.clean_blood(washshoes)
