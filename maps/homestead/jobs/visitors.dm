/decl/department/homestead/visitors
	name                    = "Visitors"
	colour                  = "#685b40"
	display_color           = "#c4bc8c"

/datum/job/homestead/visitor
	abstract_type           = /datum/job/homestead/visitor
	department_types        = list(/decl/department/homestead/visitors)

/datum/job/homestead/visitor/traveller
	title                   = "Traveller"
	supervisors             = "your conscience"
	description             = "You have travelled to this area from elsewhere. You may be a vagabond, a wastrel, a nomad, or just passing through on your way to somewhere else. How long you're staying and where you're headed is up to you entirely."
	spawn_positions         = -1
	total_positions         = -1
	outfit_type             = /decl/outfit/job/homestead/traveller
	skill_points            = 20

/obj/abstract/landmark/start/homestead/traveller
	name                    = "Traveller"

/datum/job/homestead/visitor/traveller/learned
	title                   = "Itinerant Scholar"
	// todo: outfits for alt-titles?
	alt_titles              = list("Itinerant Monk", "Travelling Doctor", "Dilettante")
	supervisors             = "your conscience"
	description             = "You are a skilled professional who has travelled to this area from elsewhere. You may be a doctor, a scholar, a monk, or some other highly-educated individual with rare skills. Whatever your reason for coming here, you are likely one of the only individuals in the area to possess your unique skillset."
	spawn_positions         = 0
	total_positions         = 2
	outfit_type             = /decl/outfit/job/homestead/traveller/scholar
	skill_points            = 26
	min_skill               = list(
		SKILL_LITERACY      = SKILL_ADEPT
	)
	max_skill               = list(
		SKILL_CHEMISTRY     = SKILL_MAX,
		SKILL_MEDICAL       = SKILL_MAX,
		SKILL_ANATOMY       = SKILL_MAX,
	)

/obj/abstract/landmark/start/homestead/traveller/learned
	name                    = "Itinerant Scholar"
