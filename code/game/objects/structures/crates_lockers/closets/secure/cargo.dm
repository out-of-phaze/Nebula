/obj/structure/closet/secure_closet/cargotech
	name = "cargo technician's locker"
	req_access = list(access_cargo)
	closet_appearance = /decl/closet_appearance/secure_closet/cargo

/obj/structure/closet/secure_closet/cargotech/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/backpack = 75,  /obj/item/backpack/satchel/grey = 25)),
		new/datum/atom_creator/simple(/obj/item/backpack/dufflebag, 25),
		/obj/item/clothing/under/cargotech,
		/obj/item/clothing/shoes/color/black,
		/obj/item/radio/headset/headset_cargo,
		/obj/item/clothing/gloves/thick,
		/obj/item/belt/general,
		/obj/item/clothing/head/soft
	)

/obj/structure/closet/secure_closet/quartermaster
	name = "quartermaster's locker"
	req_access = list(access_qm)
	closet_appearance = /decl/closet_appearance/secure_closet/cargo/qm

/obj/structure/closet/secure_closet/quartermaster/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/backpack = 75,  /obj/item/backpack/satchel/grey = 25)),
		new/datum/atom_creator/simple(/obj/item/backpack/dufflebag, 25),
		/obj/item/clothing/under/cargotech,
		/obj/item/clothing/shoes/color/brown,
		/obj/item/radio/headset/headset_cargo,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/suit/fire,
		/obj/item/tank/emergency/oxygen,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/glasses/meson,
		/obj/item/clothing/head/soft,
	)
