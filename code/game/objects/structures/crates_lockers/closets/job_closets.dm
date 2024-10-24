/* Closets for specific jobs
 * Contains:
 *		Bartender
 *		Janitor
 *		Lawyer
 */

/*
 * Bartender
 */
/obj/structure/closet/gmcloset
	name = "formal closet"
	desc = "It's a storage unit for formal clothing."
	closet_appearance = /decl/closet_appearance/wardrobe/black

/obj/structure/closet/gmcloset/WillContain()
	return list(
		/obj/item/clothing/head/that                   = 2,
		/obj/item/radio/headset/headset_service        = 2,
		/obj/item/clothing/head/hairflower             = 1,
		/obj/item/clothing/head/hairflower/pink        = 1,
		/obj/item/clothing/head/hairflower/yellow      = 1,
		/obj/item/clothing/head/hairflower/blue        = 1,
		/obj/item/clothing/under/sl_suit               = 2,
		/obj/item/clothing/under/bartender             = 2,
		/obj/item/clothing/under/dress/dress_saloon    = 1,
		/obj/item/clothing/suit/jacket/waistcoat/black = 2,
		/obj/item/clothing/shoes/color/black           = 2
	)

/*
 * Chef
 */
/obj/structure/closet/chefcloset
	name = "chef's closet"
	desc = "It's a storage unit for foodservice garments."
	closet_appearance = /decl/closet_appearance/wardrobe/black

/obj/structure/closet/chefcloset/WillContain()
	return list(
		/obj/item/clothing/under/sundress,
		/obj/item/clothing/under/waiter = 2,
		/obj/item/radio/headset/headset_service = 2,
		/obj/item/box/mousetraps = 2,
		/obj/item/clothing/under/chef,
		/obj/item/clothing/head/chefhat
	)

/*
 * Janitor
 */
/obj/structure/closet/jcloset
	name = "custodial closet"
	desc = "It's a storage unit for janitorial clothes and gear."
	closet_appearance = /decl/closet_appearance/wardrobe/mixed

/obj/structure/closet/jcloset/WillContain()
	return list(
		/obj/item/clothing/under/janitor,
		/obj/item/radio/headset/headset_service,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/head/soft/purple,
		/obj/item/clothing/head/beret/purple,
		/obj/item/flashlight,
		/obj/item/caution = 4,
		/obj/item/lightreplacer,
		/obj/item/bag/trash,
		/obj/item/clothing/shoes/galoshes,
		/obj/item/soap,
		/obj/item/belt/janitor
	)

/*
 * Lawyer
 */
/obj/structure/closet/lawcloset
	name = "legal closet"
	desc = "It's a storage unit for courtroom apparel and items."
	closet_appearance = /decl/closet_appearance/wardrobe


/obj/structure/closet/lawcloset/WillContain()
	return list(
		/obj/item/clothing/under/lawyer/female,
		/obj/item/clothing/under/lawyer,
		/obj/item/clothing/under/lawyer/red,
		/obj/item/clothing/under/lawyer/bluesuit,
		/obj/item/clothing/under/lawyer/purpsuit,
		/obj/item/clothing/suit/jacket/blue,
		/obj/item/clothing/suit/jacket/purple,
		/obj/item/clothing/shoes/color/brown,
		/obj/item/clothing/shoes/color/black
	)
