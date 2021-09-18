/decl/department/signal_medical
	name = "Colonial Health Services"
	goals = list(/datum/goal/department/medical_fatalities)
	announce_channel = "Medical"
	colour = "#008000"
	display_priority = 4
	display_color = "#d0f0c0"

/datum/job/signal/medical	
	title = "Doctor"
	//welcome_blurb = "Treat wounds, mix medicines, administer pills, and conduct surgery. Try to keep at least some of the crew alive."
	department_types = list(/decl/department/signal_medical)
	selection_color = "#87ab67"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps6,
		/datum/mil_rank/pnps/pnps5,
	)

/datum/job/signal/medical/trainee
	title = "Medical Trainee"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps1
	)

/datum/job/signal/medical/head
	title = "Chief of Medicine"
	head_position = 1
	//welcome_blurb = "Direct and coordinate the Medical crew. Don't forget to feed Ganymede."
	department_types = list(
		/decl/department/signal_medical,
		/decl/department/signal_admin
	)
	selection_color = "#50663d"
	allowed_ranks = list(
		/datum/mil_rank/pnps/el1,
		/datum/mil_rank/pnps/el2
	)

/datum/job/signal/medical/prosthetist
	title = "Prosthetist"
	//welcome_blurb = "Build and maintain station robots, install and repair prosthetic limbs, and flaunt your doctorate over the rest of Engineering."
