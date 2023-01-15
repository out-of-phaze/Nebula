/decl/lobby_handler/shiptesting
	lobby_options = list(
		/datum/lobby_option/setup,
		/datum/lobby_option/view_manifest,
		/datum/lobby_option/observe,
		/datum/lobby_option/character_setup/shiptesting,
		/datum/lobby_option/buy_ship
	)

/datum/lobby_option/character_setup/shiptesting
	sort_priority = 4

/datum/lobby_option/character_setup/shiptesting/get_lobby_menu_string(mob/new_player/viewer)
	var/list/return_string = list()
	return_string += "<hr>Current character: <a href='byond://?src=\ref[viewer.client.prefs];load=1'>"
	return_string += "<b>[viewer.client.prefs.real_name]</b></a><br>"

	if(GAME_STATE >= RUNLEVEL_GAME)
		return_string += "<a href='byond://?src=\ref[viewer];lobby_join=1'>Join Game!</a>"
	else
		return_string += "Please wait for the game to start."
	return JOINTEXT(return_string)

// This override exists only to avoid href hacking.
/mob/new_player/Topic(href, href_list)
	if(href_list["lobby_ready"])
		return
	return ..()

/datum/lobby_option/buy_ship
	sort_priority = 5

/datum/lobby_option/buy_ship/get_lobby_menu_string(mob/new_player/viewer)
	if(GAME_STATE >= RUNLEVEL_GAME)
		return "<a href='byond://?src=\ref[src];buy_ship=1'>Purchase New Ship!</a>"
	return null

/datum/lobby_option/buy_ship/proc/get_testable_ships()
	return SSmapping.get_templates_by_category(MAP_TEMPLATE_CATEGORY_SHIP)

/datum/lobby_option/buy_ship/Topic(href, href_list)
	if((. = ..()))
		return
	var/mob/new_player/user = usr
	if(!istype(user))
		return
	if(href_list["buy_ship"])
		var/list/testable_ships = get_testable_ships()
		var/ship_to_test = input(user, "Which ship do you want to purchase?", "Purchase New Ship", null) as null|anything in testable_ships
		if(!ship_to_test || !istype(testable_ships[ship_to_test], /datum/map_template/ship))
			return
		test_ship(testable_ships[ship_to_test])
		user.LateChoices()
		// TODO: move into a refresh lobby menu helper
		user.panel.close()
		user.show_lobby_menu()
		return

/datum/lobby_option/buy_ship/proc/test_ship(datum/map_template/ship_to_test)
	ship_to_test.load_new_z()