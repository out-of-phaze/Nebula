#ifndef MODPACK_END_CREDITS
#define MODPACK_END_CREDITS
#endif

var/global/list/end_titles
var/global/end_credits_song
var/global/end_credits_title
/decl/modpack/end_credits
	name = "Cinematic End Credits"

/decl/modpack/end_credits/on_round_completion()
	for(var/client/C in global.clients)
		if(!C.credits)
			C.RollCredits()

/client
	var/list/credits

/client/proc/RollCredits()
	set waitfor = FALSE

	if(get_preference_value(/datum/client_preference/show_credits) != PREF_YES)
		return

	if(!global.end_titles)
		global.end_titles = generate_titles()

	if(mob)
		mob.overlay_fullscreen("fishbed",/obj/screen/fullscreen/fishbed)
		mob.overlay_fullscreen("fadeout",/obj/screen/fullscreen/fadeout)

		if(mob.get_preference_value(/datum/client_preference/play_lobby_music) == PREF_YES)
			sound_to(mob, sound(null, channel = sound_channels.lobby_channel))
			if(global.end_credits_song == null)
				if(global.using_map.credit_sound)
					sound_to(mob, sound(pick(global.using_map.credit_sound), wait = 0, volume = 40, channel = sound_channels.lobby_channel))
			else if(get_preference_value(/datum/client_preference/play_admin_midis) == PREF_YES)
				sound_to(mob, sound(global.end_credits_song, wait = 0, volume = 40, channel = sound_channels.lobby_channel))

	sleep(5 SECONDS)
	verbs += /client/proc/ClearCredits
	for(var/credit in global.end_titles)
		var/obj/screen/credit/credit_obj = new(null, mob)
		LAZYADD(credits, credit_obj)
		credit_obj.maptext = {"<div style="font:'Small Fonts'">[credit]</div>"}
		credit_obj.rollem()
		sleep(CREDIT_SPAWN_SPEED)
	sleep(CREDIT_ROLL_SPEED - CREDIT_SPAWN_SPEED)

	ClearCredits()
	verbs -= /client/proc/ClearCredits

/client/proc/ClearCredits()
	set name = "Stop End Titles"
	set category = "OOC"
	verbs -= /client/proc/ClearCredits
	QDEL_NULL_LIST(credits)
	mob.clear_fullscreen("fishbed")
	mob.clear_fullscreen("fadeout")
	sound_to(mob, sound(null, channel = sound_channels.lobby_channel))

/proc/get_end_credits_title(var/force)
	if(!global.end_credits_title || force)
		var/list/possible_titles = list()
		SSlore.refresh_credits_from_departments()
		possible_titles += "THE [pick("DOWNFALL OF", "RISE OF", "TROUBLE WITH", "FINAL STAND OF", "DARK SIDE OF", "DESOLATION OF", "DESTRUCTION OF", "CRISIS OF")] [pick(SSlore.credits_nouns)]"
		possible_titles += "[pick(SSlore.credits_crew_names)] GETS SERIOUS ABOUT [pick(SSlore.credits_topics)]"
		possible_titles += "[pick(SSlore.credits_crew_names)] GETS [pick(SSlore.credits_crew_outcomes)]"
		possible_titles += "[pick(SSlore.credits_crew_names)] LEARNS ABOUT [pick(SSlore.credits_topics)]"
		possible_titles += "A VERY [pick(SSlore.credits_adjectives)] [pick(SSlore.credits_holidays)]"
		possible_titles += "[pick(SSlore.credits_adjectives)] [pick(SSlore.credits_adventure_names)]"
		possible_titles += "[pick(SSlore.credits_topics)] [pick(SSlore.credits_adventure_names)]"
		possible_titles += "THE DAY [uppertext(global.using_map.station_short)] STOOD STILL"
		possible_titles |= SSlore.credits_other
		global.end_credits_title = pick(possible_titles)
	. = global.end_credits_title

/proc/generate_titles()
	var/list/titles = list()
	var/list/cast = list()
	var/list/chunk = list()
	var/chunksize = 0
	titles += "<center><h1>EPISODE [rand(1,1000)]<br>[SSlore.get_end_credits_title()]<h1></h1></h1></center>"

	for(var/mob/living/human/H in global.living_mob_list_|global.dead_mob_list_)
		if(findtext(H.real_name,"(mannequin)"))
			continue
		if(H.isMonkey() && findtext(H.real_name,"[lowertext(H.species.name)]")) //no monki
			continue
		if(H.timeofdeath && H.timeofdeath < 5 MINUTES) //don't mention these losers (prespawned corpses mostly)
			continue
		if(!cast.len && !chunksize)
			chunk += "CAST:"
		var/job = ""
		if(GetAssignment(H) != "Unassigned")
			job = ", [uppertext(GetAssignment(H))]"
		var/used_name = H.real_name
		var/datum/computer_file/report/crew_record/record = get_crewmember_record(H.real_name)
		if(record && record.get_rank())
			var/datum/mil_rank/rank = global.using_map.get_rank(record.get_branch(), record.get_rank())
			if(rank.name_short)
				used_name = "[rank.name_short] [used_name]"
		var/showckey = 0
		if(H.ckey && H.client)
			if(H.client.get_preference_value(/datum/client_preference/show_ckey_credits) == PREF_SHOW)
				showckey = 1
		var/decl/background_detail/background = H.get_background_datum_by_flag(BACKGROUND_FLAG_NAMING)
		if(!background || !(H.species.spawn_flags & SPECIES_CAN_JOIN) || prob(10))
			background = GET_DECL(/decl/background_detail/heritage/human)
		if(!showckey)
			if(prob(90))
				chunk += "[background.get_random_cultural_name(H, H.gender, H.get_species())]\t \t \t \t[uppertext(used_name)][job]"
			else
				var/decl/pronouns/pronouns = H.get_pronouns()
				chunk += "[used_name]\t \t \t \t[uppertext(pronouns.him)]SELF"
		else
			chunk += "[uppertext(background.get_random_cultural_name(H, H.gender, H.get_species()))] a.k.a. '[uppertext(H.ckey)]'\t \t \t \t[uppertext(used_name)][job]"
		chunksize++
		if(chunksize > 2)
			cast += "<center>[jointext(chunk,"<br>")]</center>"
			chunk.Cut()
			chunksize = 0
	if(chunk.len)
		cast += "<center>[jointext(chunk,"<br>")]</center>"

	titles += cast

	var/list/corpses = list()
	var/list/monkies = list()
	for(var/mob/living/human/H in global.dead_mob_list_)
		if(H.timeofdeath < 5 MINUTES) //no prespawned corpses
			continue
		if(H.isMonkey() && findtext(H.real_name,"[lowertext(H.species.name)]"))
			monkies[H.species] += 1
		else if(H.real_name)
			corpses += H.real_name
	for(var/decl/species/monkey_species in monkies)
		corpses += "[monkies[monkey_species]] [lowertext(monkies[monkey_species] > 1 ? monkey_species.name_plural : monkey_species.name)]"
	if(corpses.len)
		titles += "<center>BASED ON REAL EVENTS<br>In memory of [english_list(corpses)].</center>"

	var/list/staff = list("PRODUCTION STAFF:")
	var/list/staffjobs = list("Coffee Fetcher", "Cameraman", "Angry Yeller", "Chair Operator", "Choreographer", "Historical Consultant", "Costume Designer", "Chief Editor", "Executive Assistant")
	var/list/goodboys = list()
	for(var/client/C)
		if(!C.holder)
			continue
		if(C.holder.rights & (R_DEBUG|R_ADMIN))
			var/list/all_backgrounds = decls_repository.get_decls_of_subtype(/decl/background_detail/heritage)
			var/decl/background_detail/cult = all_backgrounds[pick(all_backgrounds)]
			staff += "[uppertext(pick(staffjobs))] - [cult.get_random_cultural_name(C.mob, C.mob.gender, C.mob.get_species())] a.k.a. '[C.key]'"
		else if(C.holder.rights & R_MOD)
			goodboys += "[C.key]"

	titles += "<center>[jointext(staff,"<br>")]</center>"
	if(goodboys.len)
		titles += "<center>STAFF'S GOOD BOYS:<br>[english_list(goodboys)]</center><br>"

	var/disclaimer = "<br>Sponsored by [global.using_map.company_name].<br>All rights reserved.<br>\
					 This motion picture is protected under the copyright laws of the Sol Central Government<br> and other nations throughout the galaxy.<br>\
					 Colony of First Publication: [pick("Mars", "Luna", "Earth", "Venus", "Phobos", "Ceres", "Tiamat", "Ceti Epsilon", "Eos", "Pluto", "Ouere",\
					 "Lordania", "Kingston", "Cinu", "Yuklid V", "Lorriman", "Tersten", "Gaia")].<br>"
	disclaimer += pick("Use for parody prohibited. PROHIBITED.",
					   "All stunts were performed by underpaid interns. Do NOT try at home.",
					   "[global.using_map.company_name] does not endorse behaviour depicted. Attempt at your own risk.",
					   "Any unauthorized exhibition, distribution, or copying of this film or any part thereof (including soundtrack)<br>\
						may result in an ERT being called to storm your home and take it back by force.",
						"The story, all names, characters, and incidents portrayed in this production are fictitious. No identification with actual<br>\
						persons (living or deceased), places, buildings, and products is intended or should be inferred.<br>\
						This film is based on a true story and all individuals depicted are based on real people, despite what we just said.",
						"No person or entity associated	with this film received payment or anything of value, or entered into any agreement, in connection<br>\
						with the depiction of tobacco products, despite the copious amounts	of smoking depicted within.<br>\
						(This disclaimer sponsored by Carcinoma - Carcinogens are our Business!(TM)).",
						"No animals were harmed in the making of this motion picture except for those listed previously as dead. Do not try this at home.")
	titles += "<hr>"
	titles += "<center><span style='font-size:6pt;'>[JOINTEXT(disclaimer)]</span></center>"

	return titles

// Screen Objects
/obj/screen/credit
	icon_state = "blank"
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
	alpha = 0
	screen_loc = "CENTER-7,BOTTOM+1"
	plane = HUD_PLANE
	layer = HUD_ABOVE_ITEM_LAYER
	maptext_height = WORLD_ICON_SIZE * 2
	maptext_width  = WORLD_ICON_SIZE * 14
	requires_ui_style = FALSE
	var/client/parent
	var/matrix/target

/obj/screen/credit/proc/rollem()
	var/matrix/M = matrix(transform)
	M.Translate(0, CREDIT_ANIMATE_HEIGHT)
	animate(src, transform = M, time = CREDIT_ROLL_SPEED)
	target = M
	animate(src, alpha = 255, time = CREDIT_EASE_DURATION, flags = ANIMATION_PARALLEL)
	addtimer(CALLBACK(src, PROC_REF(ease_out)), CREDIT_ROLL_SPEED - CREDIT_EASE_DURATION)
	var/mob/owner = owner_ref?.resolve()
	if(istype(owner) && owner.client)
		owner.client.screen += src

/obj/screen/credit/proc/ease_out()
	if(QDELETED(src))
		return
	animate(src, alpha = 0, transform = target, time = CREDIT_EASE_DURATION)
	QDEL_IN_CLIENT_TIME(src, CREDIT_EASE_DURATION)

/obj/screen/credit/Destroy()
	var/client/P = parent
	if(istype(P))
		P.screen -= src
		LAZYREMOVE(P.credits, src)
	parent = null
	return ..()

// Admin Secrets
/datum/admin_secret_item/fun_secret/change_credits_song
	name = "Change End Credits Song"
/datum/admin_secret_item/fun_secret/change_credits_title
	name = "Change End Credits Title"

/datum/admin_secret_item/fun_secret/change_credits_song/do_execute()
	var/selected = input("Select a music track for the credits.", "Server music list") as null|anything in decls_repository.get_decl_paths_of_subtype(/decl/music_track)
	if(selected)
		var/decl/music_track/track = GET_DECL(selected)
		global.end_credits_song = track.song
	SSstatistics.add_field_details("admin_verb","CECS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/datum/admin_secret_item/fun_secret/change_credits_title/do_execute()
	global.end_credits_title = input(usr, "What title would you like for the end credits?") as null|text
	if(global.end_credits_title)
		SSstatistics.add_field_details("admin_verb","CECT") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

// Preferences
/datum/client_preference/show_credits
	description = "Show End Titles"
	key = "SHOW_CREDITS"

/datum/client_preference/show_ckey_credits
	description = "Show Ckey in End Credits"
	key = "SHOW_CKEY_CREDITS"
	options = list(PREF_HIDE, PREF_SHOW)

// Overrides
/decl/webhook/roundend/get_round_title()
	return global.end_credits_title