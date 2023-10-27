/decl/department/signal_science
	name = "Colonial Surveyors"
	colour = "#683ec9"
	display_color = "#aa9bcc"
	display_priority = 2

/datum/job/signal/scientist
	title = "Research Scientist"
	welcome_blurb = "You have a PhD, a laboratory full of gizmos, and nothing but free time. Make the most of it."
	department_types = list(/decl/department/signal_science)
	selection_color = "#795fb8"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps6,
		/datum/mil_rank/pnps/pnps5
	)
	outfit_type = /decl/hierarchy/outfit/job/signal_science/scientist

/datum/job/signal/scientist/trainee
	title = "Research Trainee"
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps1
	)
	outfit_type = /decl/hierarchy/outfit/job/signal_science/trainee

/datum/job/signal/scientist/head
	title = "Chief of Research"
	head_position = TRUE
	selection_color = "#493970"
	department_types = list(
		/decl/department/signal_science,
		/decl/department/signal_admin
	)
	allowed_ranks = list(
		/datum/mil_rank/pnps/el1,
		/datum/mil_rank/pnps/el2
	)
	outfit_type = /decl/hierarchy/outfit/job/signal_science/chief

/datum/job/signal/scientist/aquanaut
	title = "Aquanaut"
	welcome_blurb = "Head out into the abyssal caves to find and recover scrap metal, materials, black box recorders and artefacts."
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps6,
		/datum/mil_rank/pnps/pnps5,
		/datum/mil_rank/pnps/pnps4
	)
	outfit_type = /decl/hierarchy/outfit/job/signal_science/aquanaut