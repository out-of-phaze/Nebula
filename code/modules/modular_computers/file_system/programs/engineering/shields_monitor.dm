/datum/computer_file/program/shields_monitor
	filename = "shieldsmonitor"
	filedesc = "Shield Generators Monitoring"
	nanomodule_path = /datum/nano_module/program/shields_monitor/
	program_icon_state = "shield"
	program_key_state = "generic_key"
	program_menu_icon = "radio-on"
	extended_desc = "This program connects to shield generators and monitors their statuses."
	ui_header = "shield.gif"
	network_destination = "shields monitoring system"
	requires_network = 1
	requires_network_feature = NET_FEATURE_SYSTEMCONTROL
	size = 10
	category = PROG_ENG

/datum/nano_module/program/shields_monitor
	name = "Shields monitor"
	var/obj/machinery/shield_generator/active = null

/datum/nano_module/program/shields_monitor/Destroy()
	. = ..()
	deselect_shield()

/datum/nano_module/program/shields_monitor/proc/can_connect_to_shield(obj/machinery/shield_generator/S)
	var/datum/computer_network/network = get_network()
	if(!network)
		return FALSE
	return LEVELS_ARE_Z_CONNECTED(network.get_router_z(), get_z(S))

/datum/nano_module/program/shields_monitor/proc/get_shields()
	var/list/shields = list()
	for(var/obj/machinery/shield_generator/S in SSmachines.machinery)
		if(!can_connect_to_shield(S))
			continue
		shields.Add(S)

	if(!(active in shields))
		deselect_shield()
	return shields

/datum/nano_module/program/shields_monitor/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = global.default_topic_state)
	var/list/data = host.initial_data()
	if(!can_connect_to_shield(active))
		deselect_shield()
	if (active)
		data["active"] = 1
		data["running"] = active.running
		data["modes"] = active.get_flag_descriptions()
		data["overloaded"] = active.overloaded
		data["mitigation_max"] = active.mitigation_max
		data["mitigation_physical"] = round(active.mitigation_physical, 0.1)
		data["mitigation_em"] = round(active.mitigation_em, 0.1)
		data["mitigation_heat"] = round(active.mitigation_heat, 0.1)
		data["field_integrity"] = active.field_integrity()
		data["max_energy"] = round(active.max_energy / 1000000, 0.1)
		data["current_energy"] = round(active.current_energy / 1000000, 0.1)
		if(data["max_energy"] > 0)
			data["percentage_energy"] = round(data["current_energy"] / data["max_energy"] * 100)
		else
			data["percentage_energy"] = "ERR"
		data["total_segments"] = active.field_segments ? active.field_segments.len : 0
		data["functional_segments"] = active.damaged_segments ? data["total_segments"] - active.damaged_segments.len : data["total_segments"]
		data["field_radius"] = active.field_radius
		data["input_cap_kw"] = round(active.input_cap / 1000)
		data["upkeep_power_usage"] = round(active.upkeep_power_usage / 1000, 0.1)
		data["power_usage"] = round(active.power_usage / 1000)
		data["hacked"] = active.hacked
		data["offline_for"] = active.offline_for * 2
		data["pos_x"] = active.x
		data["pos_y"] = active.y
		data["pos_z"] = active.z
	else
		data["active"] = null
		var/list/shields = get_shields()
		var/list/shields_info = list()
		for(var/obj/machinery/shield_generator/S in shields)
			var/area/A = get_area(S)
			var/list/temp = list(list(
				"shield_status" = S.running,
				"shield_ref" = any2ref(S),
				"area" = A.proper_name))
			shields_info.Add(temp)
		data["shields"] = shields_info

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "shields_monitor.tmpl", "Shield Generators Monitoring", 400, 500, state = state)
		if(host.update_layout())
			ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/datum/nano_module/program/shields_monitor/Topic(href, href_list)
	if(..())
		return 1
	if( href_list["refresh"] )
		get_shields()
		return 1
	if( href_list["return"] )
		deselect_shield()
		return 1
	if( href_list["ref"] )
		var/list/shields = get_shields()
		var/obj/machinery/shield_generator/S = locate(href_list["ref"]) in shields
		if(S)
			deselect_shield()
			events_repository.register(/decl/observ/destroyed, S, src, TYPE_PROC_REF(/datum/nano_module/program/shields_monitor, deselect_shield))
			active = S
		return 1

/datum/nano_module/program/shields_monitor/proc/deselect_shield(var/source)
	if(!active)
		return
	events_repository.unregister(/decl/observ/destroyed, active, src)
	active = null
	if(source) // source is only set if called by the shield destroyed event, which is the only time we want to update the UI
		SSnano.update_uis(src)