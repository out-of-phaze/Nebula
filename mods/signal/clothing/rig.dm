
/obj/item/rig/europa_navy
	name = "naval hardsuit control module"
	desc = "An iconic blue-and-orange set of powered armour worn by the Jovian Navy."
	icon = 'mods/signal/icons/navy_rig.dmi'
	suit_type = "naval hardsuit"
	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_AP,
		laser = ARMOR_LASER_RIFLES,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
		)
	online_slowdown = 1
	offline_slowdown = 3
	offline_vision_restriction = TINT_HEAVY
	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/handcuffs,
		/obj/item/t_scanner,
		/obj/item/rcd,
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/multitool,
		/obj/item/radio, 
		/obj/item/scanner/gas,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/baton,
		/obj/item/gun,
		/obj/item/storage/firstaid, 
		/obj/item/chems/hypospray, 
		/obj/item/roller, 
		/obj/item/suit_cooling_unit
	)

	chest =  /obj/item/clothing/suit/space/rig/europa_navy
	helmet = /obj/item/clothing/head/helmet/space/rig/europa_navy
	boots =  /obj/item/clothing/shoes/magboots/rig/europa_navy
	gloves = /obj/item/clothing/gloves/rig/europa_navy

/obj/item/clothing/head/helmet/space/rig/europa_navy
	icon = 'mods/signal/icons/clothing/hats/navy_rig.dmi'
/obj/item/clothing/suit/space/rig/europa_navy
	icon = 'mods/signal/icons/clothing/suits/navy_rig.dmi'
/obj/item/clothing/shoes/magboots/rig/europa_navy
	icon = 'mods/signal/icons/clothing/shoes/navy_rig.dmi'
/obj/item/clothing/gloves/rig/europa_navy
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_NOCUFFS
	icon = 'mods/signal/icons/clothing/gloves/navy_rig.dmi'

/obj/item/rig/europa_navy/equipped
	initial_modules = list(
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/vision/multi,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/combat,
		/obj/item/rig_module/cooling_unit
	)
