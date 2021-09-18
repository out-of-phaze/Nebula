/decl/department/signal_admin
	name = "Colonial Executive"
	colour = "#5e3123"
	display_color = "#e8957b"
	display_priority = 6

/obj/machinery/network/pager
	department = /decl/department/signal_admin

/datum/job/signal/administrator
	title = "Executive Assistant"
	//welcome_blurb = "Assist the Colony Director in managing the crew and keeping the station running. Hand out access to those who need it, or terminate access for those who have been fired."
	supervisors = "the Colonial Executive"
	department_types = list(/decl/department/signal_admin)
	selection_color = "#ad5e45"
	allowed_ranks = list(
		/datum/mil_rank/pnps/el1
	)

/datum/job/signal/administrator/assistant
	title = "Assistant Director"
	supervisors = "the Colony Director"
	allowed_ranks = list(
		/datum/mil_rank/pnps/el2
	)

/datum/job/signal/administrator/head
	title = "Colony Director"
	supervisors = "the Secretary of the Department of Planetary Exploitation"
	selection_color = "#5e3123"
	head_position = TRUE
	//welcome_blurb = "You are in charge of the entire colony and everyone on it. Keep it running smoothly. The buck stops with you."
	allowed_ranks = list(
		/datum/mil_rank/pnps/ses1
	)
