// verb for admins to set custom event
/client/proc/cmd_admin_change_custom_event()
	set category = "Fun"
	set name = "Change Custom Event"

	if(!holder)
		to_chat(src, "Only administrators may use this command.")
		return

	var/input = sanitize(input(usr, "Enter the description of the custom event. Be descriptive. To cancel the event, make this blank or hit cancel.", "Custom Event", global.custom_event_msg) as message|null, MAX_BOOK_MESSAGE_LEN, extra = 0)
	if(isnull(input))
		return
	if(input == "")
		global.custom_event_msg = null
		log_admin("[usr.key] has cleared the custom event text.")
		message_admins("[key_name_admin(usr)] has cleared the custom event text.")
		return

	log_admin("[usr.key] has changed the custom event text.")
	message_admins("[key_name_admin(usr)] has changed the custom event text.")

	global.custom_event_msg = input

	to_world("<h1 class='alert'>Custom Event</h1>")
	to_world("<h2 class='alert'>A custom event is starting. OOC Info:</h2>")
	to_world("<span class='alert'>[global.custom_event_msg]</span>")
	to_world("<br>")

	SSwebhooks.send(WEBHOOK_CUSTOM_EVENT, list("text" = global.custom_event_msg))

// normal verb for players to view info
/client/verb/cmd_view_custom_event()
	set category = "OOC"
	set name = "Custom Event Info"

	if(!global.custom_event_msg)
		to_chat(src, "There currently is no known custom event taking place.")
		to_chat(src, "Keep in mind: it is possible that an admin has not properly set this.")
		return

	to_chat(src, "<h1 class='alert'>Custom Event</h1>")
	to_chat(src, "<h2 class='alert'>A custom event is taking place. OOC Info:</h2>")
	to_chat(src, "<span class='alert'>[global.custom_event_msg]</span>")
	to_chat(src, "<br>")
