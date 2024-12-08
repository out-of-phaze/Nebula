/obj/random/tool
	name = "random tool"
	desc = "This is a random tool."
	icon = 'icons/obj/items/tool/welders/welder.dmi'
	icon_state = ICON_STATE_WORLD

/obj/random/tool/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/screwdriver           = 5,
		/obj/item/wirecutters           = 5,
		/obj/item/weldingtool           = 5,
		/obj/item/weldingtool/largetank = 1,
		/obj/item/crowbar               = 5,
		/obj/item/wrench                = 5,
		/obj/item/flashlight            = 5
	)
	return spawnable_choices

/obj/random/tool/power
	name = "random powertool"
	desc = "This is a random rare powertool for maintenance"

/obj/random/tool/power/spawn_choices()
	var/static/list/spawnable_choices
	if(!spawnable_choices)
		spawnable_choices = list(
			/obj/item/weldingtool/electric     = 15,
			/obj/item/weldingtool/experimental =  3,
			/obj/item/tool/hydraulic_cutter    =  1,
			/obj/item/tool/power_drill         =  1
		)
		var/list/temp_spawnables
		var/total_weight
		EXPAND_RANDOM_SPAWNER_LIST(/obj/random/tool, temp_spawnables, total_weight, spawnable_choices, 320)
	return spawnable_choices

/obj/random/toolbox
	name = "random toolbox"
	desc = "This is a random toolbox."
	icon = 'icons/obj/items/storage/toolboxes/toolbox_red.dmi'
	icon_state = ICON_STATE_WORLD

/obj/random/toolbox/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/toolbox/mechanical = 30,
		/obj/item/toolbox/electrical = 20,
		/obj/item/toolbox/emergency  = 20,
		/obj/item/toolbox/repairs    = 20,
		/obj/item/toolbox/syndicate  =  1
	)
	return spawnable_choices
