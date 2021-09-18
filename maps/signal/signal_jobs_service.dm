/decl/department/signal_service
	name = "Colonial Logistics"
	colour = "#82715b"
	display_color = "#e3d4c1"
	display_priority = 1

/datum/job/signal/service
	title = "Hospitality Worker"
	department_types = list(/decl/department/signal_service)
	selection_color = "#8c704d"
	//welcome_blurb = "Grow food and stock the cafeteria with meals and drinks to keep the crew moving. Avoid letting them find out you're serving them monkey steak."

/datum/job/signal/service/head
	title = "Chief of Logistics"
	head_position = 1
	//welcome_blurb = "Direct and coordinate the Supply department. Make orders, deploy supply beacons, and draft Employees to drag crates around when you can't be bothered."
	selection_color = "#574631"
	department_types = list(
		/decl/department/signal_service,
		/decl/department/signal_admin
	)
	allowed_ranks = list(
		/datum/mil_rank/pnps/el1,
		/datum/mil_rank/pnps/el2
	)

/datum/job/signal/service/janitor
	title = "Sanitation Technician"
	//welcome_blurb = "Keep the station clean and tidy. Put out wet floor signs while mopping and watch people slip over anyway."

/datum/job/signal/service/cargo
	title = "Supply Technician"
	//welcome_blurb = "Take orders for new equipment, encode supply chits via the main console, and take supply beacons out for ballistic supply pod delivery. Try not to stand under them."

/datum/job/signal/service/miner
	title = "Ice Miner"

/datum/job/signal/service/pilot
	title = "Submarine Pilot"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps6,
		/datum/mil_rank/pnps/pnps5,
		/datum/mil_rank/pnps/pnps4
	)
