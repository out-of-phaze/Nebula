/decl/department/signal_security
	name = "Colonial Police"
	announce_channel = "Security" // TODO: police or civil services channel
	colour = "#000080"
	display_priority = 3
	display_color = "#c8cedb"

/datum/job/signal/police
	title = "Police Officer"
	//welcome_blurb = "Keep the peace amongst the crew. Sort out small disturbances and fights, and coordinate with your team to respond to larger crises."
	department_types = list(/decl/department/signal_security)
	selection_color = "#595eab"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps4,
		/datum/mil_rank/pnps/pnps3
	)

/datum/job/signal/police/trainee
	title = "Police Trainee"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps1
	)

/datum/job/signal/police/quartermaster
	title = "Police Quartermaster"
	//welcome_blurb = "Look after the armory, hand out weapons as directed, and keep an eye on any prisoners in the brig."
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps6,
		/datum/mil_rank/pnps/pnps5,
	)

/datum/job/signal/police/head
	title = "Chief of Police"
	head_position = 1
	//welcome_blurb = "Direct and coordinate the colonial police."
	selection_color = "#333661"
	department_types = list(
		/decl/department/signal_security,
		/decl/department/signal_admin
	)
	allowed_ranks = list(
		/datum/mil_rank/pnps/el1,
		/datum/mil_rank/pnps/el2
	)