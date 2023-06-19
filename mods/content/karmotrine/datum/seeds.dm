/datum/seed/bronson
	name = "bronsonroot"
	product_name = "bronson root"
	display_name = "bronson root stalks"
	// it's good for you!
	chems = list(/decl/material/liquid/nutriment = list(2,10), /decl/material/liquid/blendable/bronson_extract = list(3,5))
	grown_tag = "bronson"

/datum/seed/bronson/New()
	..()
	set_trait(TRAIT_MATURATION,10)
	set_trait(TRAIT_PRODUCTION,1)
	set_trait(TRAIT_YIELD,5)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"bulb")
	set_trait(TRAIT_PRODUCT_COLOUR,"#ffc73e")
	set_trait(TRAIT_PLANT_ICON,"stalk")
	set_trait(TRAIT_WATER_CONSUMPTION, 5)

/obj/item/seeds/bronson
	seed = "bronsonroot"

/decl/hierarchy/supply_pack/hydroponics/seeds/Initialize()
	contains += /obj/item/seeds/bronson
	. = ..()

/obj/machinery/seed_storage/garden/Initialize()
	starting_seeds[/obj/item/seeds/bronson] = 15
	. = ..()

/obj/machinery/seed_storage/xenobotany/Initialize()
	starting_seeds[/obj/item/seeds/bronson] = 15
	. = ..()
