// OUTFITS
/decl/hierarchy/outfit/job/tradeship
	abstract_type = /decl/hierarchy/outfit/job/tradeship
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store_str
	l_ear = null
	r_ear = null

/decl/hierarchy/outfit/job/tradeship/hand
	name = "Tradeship - Job - Deck Hand"

/decl/hierarchy/outfit/job/tradeship/hand/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(list(
		/obj/item/clothing/under/overalls,
		/obj/item/clothing/under/hazard,
		/obj/item/clothing/under/cargotech,
		/obj/item/clothing/under/color/black,
		/obj/item/clothing/under/color/grey
	))

/decl/hierarchy/outfit/job/tradeship/hand/cook
	name = "Tradeship - Job - Cook"
	head = /obj/item/clothing/head/chefhat
