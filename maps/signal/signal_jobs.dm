/datum/map/signal
	default_job_type =        /datum/job/signal
	default_department_type = /decl/department/signal_civilian
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK

/datum/map/signal/New()
	allowed_jobs = typesof(default_job_type)
	..()

/decl/department/signal_civilian
	name = "Colonial Public"
	colour = "#666666"
	display_color = "#cccccc"

/datum/job/signal
	title = "Employee"
	welcome_blurb = "Research facilities often need people to do odd jobs. Today, that would be you."
	supervisors = "absolutely everyone"
	total_positions = -1
	spawn_positions = -1
	department_types = list(/decl/department/signal_civilian)
	selection_color = "#666666"
	outfit_type = /decl/hierarchy/outfit/job/generic

	allowed_branches = list(
		/datum/mil_branch/signal_public_service
	)
	allowed_ranks = list(
		/datum/mil_rank/pnps/pnps3,
		/datum/mil_rank/pnps/pnps2,
		/datum/mil_rank/pnps/pnps1
	)

/*
	title = "Foundation Agent"
	welcome_blurb = "You are a Cuchulain Foundation field agent on secondment to your current site. When there's something strange in the neighborhood, you're the one they call."

	title = "Psionics Liaison"
	welcome_blurb = "You are a representative of the Cuchulain Foundation, serving as a consultant to the crew on psionic matters."
*/
