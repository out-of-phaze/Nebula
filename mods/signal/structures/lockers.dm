/obj/structure/closet/emergency_europa
	name = "emergency closet"
	desc = "It's a storage locker for an emergency pressure suits and O2 tanks."
	closet_appearance = /decl/closet_appearance/emergency_europa

/decl/closet_appearance/emergency_europa
	color = COLOR_ORANGE
	decals = list("lower_vent")
	extra_decals = list("oxy" = COLOR_OFF_WHITE)

/obj/structure/closet/emergency_europa/WillContain()

	. = list(
		/obj/item/clothing/mask/breath = 2,
		/obj/item/clothing/suit/space/emergency/europa = 2,
		/obj/item/clothing/head/helmet/space/emergency/europa = 2,
		/obj/item/tank/emergency/oxygen/engi = 2,
		/obj/item/crowbar = 2
	)

	. += new /datum/atom_creator/simple(list(/obj/item/storage/toolbox/emergency, /obj/item/inflatable = 2), 75)
	. += new /datum/atom_creator/simple(/obj/item/clothing/mask/gas/half, 10)
	. += new /datum/atom_creator/simple(/obj/item/oxycandle, 15)
	. += new /datum/atom_creator/simple(/obj/item/storage/firstaid/o2, 25)

/obj/structure/closet/secure_closet/security_europa
	name = "secure police locker"
	desc = "An access-restricted locker for holding police gear."
	closet_appearance = /decl/closet_appearance/security_europa

/decl/closet_appearance/security_europa
	color = COLOR_PALE_BLUE_GRAY
	decals = list("lower_vent")
	extra_decals = list("stripe_vertical_checker_full" = COLOR_OFF_WHITE)
