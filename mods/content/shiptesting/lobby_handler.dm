/decl/lobby_handler/shiptesting
	lobby_options = list(
		/datum/lobby_option/setup,
		/datum/lobby_option/view_ship_manifest,
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
	return "<a href='byond://?src=\ref[src];buy_ship=1'>Purchase New Ship!</a>"

/datum/lobby_option/buy_ship/visible(mob/new_player/viewer)
	return GAME_STATE == RUNLEVEL_GAME

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
		test_ship(testable_ships[ship_to_test], user)
		return

/datum/lobby_option/buy_ship/proc/test_ship(datum/map_template/ship_to_test, mob/new_player/user)
	var/expected_zlevel = world.maxz + 1 // since loading might call stoplag, we can't rely on the new value of maxz being our ship
	ship_to_test.load_new_z()
	to_chat(user, SPAN_NOTICE("Your ship is now being prepared for testing, please wait..."))
	user.close_spawn_windows()
	var/datum/submap/our_submap = null
	for(var/datum/submap/candidate_submap in SSmapping.submaps)
		if(candidate_submap.associated_z == expected_zlevel) // todo: refactor to make getting the spawned submap easier
			our_submap = candidate_submap
			break
	if(!istype(our_submap))
		to_chat(user, SPAN_WARNING("Something went wrong while preparing your ship, please contact an admin for assistance!"))
		user.show_lobby_menu()
		return
	our_submap.join_as(user, our_submap.jobs[our_submap.jobs[1]]) // we assume the first job is the captain role, TODO: specify explicitly

/decl/submap_archetype/proc/is_manifest_visible()
	return FALSE

/decl/submap_archetype/spawnable_ship/is_manifest_visible()
	return TRUE

/datum/lobby_option/view_ship_manifest
	sort_priority = 2

/datum/lobby_option/view_ship_manifest/visible(mob/new_player/viewer)
	return GAME_STATE >= RUNLEVEL_GAME

/datum/lobby_option/view_ship_manifest/get_lobby_menu_string(mob/new_player/viewer)
	return "<a href='byond://?src=\ref[src];view_manifest=1'>View the Ship Manifest</A> "

/datum/lobby_option/view_ship_manifest/Topic(href, href_list)
	if((. = ..()))
		return
	var/mob/new_player/user = usr
	if(!istype(user))
		return
	if(href_list["view_manifest"])
		var/dat = "<div align='center'>"
		dat += html_ship_manifest(OOC = TRUE)
		var/datum/browser/popup = new(user, "Ship Manifest", "Ship Manifest", 370, 420, user)
		popup.add_stylesheet("nano_shared", 'nano/css/shared.css')
		popup.set_content(dat)
		popup.open()
		return TOPIC_HANDLED

/proc/html_ship_manifest(monochrome = FALSE, OOC = FALSE)
	var/list/dat = list({"
	<style>
		.manifest {border-collapse:collapse;width:100%;}
		.manifest td, th {border:1px solid [monochrome?"black":"[OOC?"black; color:white":"#DEF; color:black"]"]; padding:.25em}
		.manifest th {height: 2em; [monochrome?"border-top-width: 3px":"background-color: [OOC?"#40628a":"#48C"]; color:white"]}
		.manifest tr.head th { [monochrome?"border-top-width: 1px":"background-color: [OOC?"#013D3B;":"#488;"]"] }
		.manifest td:first-child {text-align:right}
		.manifest tr.alt td {[monochrome?"border-top-width: 2px":"background-color: [OOC?"#373737; color:white":"#DEF"]"]}
	</style>
	<table class="manifest" width='350px'>
	<tr class='head'><th>Name</th><th>Position</th></tr>
	"})
	var/list/submaps = list()
	for(var/mob/living/carbon/human/character in human_mob_list)
		var/datum/job/submap/submap_job = character.mind?.assigned_job
		if(!istype(submap_job))
			continue
		if(!submap_job.owner.archetype.is_manifest_visible())
			continue
		LAZYADD(submaps[submap_job.owner], list(list(character.real_name, character.mind.role_alt_title || character.mind.assigned_role)))

	for(var/datum/submap/submap in submaps)
		if(!submap.archetype.is_manifest_visible())
			continue
		dat += "<tr><th colspan=2>[submap.name] ([submap.archetype.descriptor]):</th></tr>"
		for(var/entry in submaps[submap])
			dat += "<tr class='candystripe'><td>[entry[1]]</td><td>[entry[2]]</td></tr>"
	dat += "</table>"
	dat = JOINTEXT(dat)
	dat = replacetext(dat, "\n", "") // so it can be placed on paper correctly
	dat = replacetext(dat, "\t", "")
	return dat

/mob/observer/ghost/view_manfiest()
	var/dat
	dat += "<h4>Ship Manifest</h4>"
	dat += html_ship_manifest()

	show_browser(src, dat, "window=manifest;size=370x420;can_close=1")