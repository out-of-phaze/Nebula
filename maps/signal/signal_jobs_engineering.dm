/decl/department/signal_engineering
	name = "Colonial Maintenance"
	colour = "#ffcc40"
	display_color = "#f2dfaa"
	display_priority = 5

/datum/job/signal/engineer
	title = "Civil Engineer"
	//welcome_blurb = "Keep the lights on, the water out, and the power flowing. Easier said than done."
	department_types = list(/decl/department/signal_engineering)
	selection_color = "#c99526"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps5,
		/datum/mil_rank/pnps/pnps4,
		/datum/mil_rank/pnps/pnps3,
		/datum/mil_rank/pnps/pnps2,
	)

/datum/job/signal/engineer/trainee
	title = "Engineer Trainee"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps1
	)

/datum/job/signal/engineer/head
	title = "Chief of Engineering"
	selection_color = "#73581e"
	head_position = 1
	//welcome_blurb = "Coordinate and direct the Engineering department in keeping the facility in one piece. Try not to go mad."
	department_types = list(
		/decl/department/signal_engineering,
		/decl/department/signal_admin
	)
	allowed_ranks = list(
		/datum/mil_rank/pnps/el1,
		/datum/mil_rank/pnps/el2
	)

/datum/job/signal/engineer/robotics
	title = "Robotics Engineer"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps6,
		/datum/mil_rank/pnps/pnps5,
		/datum/mil_rank/pnps/pnps4
	)
