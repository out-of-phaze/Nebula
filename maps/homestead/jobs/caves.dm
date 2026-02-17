/datum/job/homestead/caves
	abstract_type           = /datum/job/homestead/caves

/datum/job/homestead/caves/dweller
	title                   = "Cave Dweller"
	spawn_positions         = -1
	total_positions         = -1
	outfit_type             = /decl/outfit/job/homestead/cave_dweller
	max_skill               = list(
		SKILL_MEDICAL       = SKILL_MAX,
		SKILL_ANATOMY       = SKILL_MAX,
		SKILL_CHEMISTRY     = SKILL_MAX,
	)
	skill_points            = 24

/obj/abstract/landmark/start/homestead/cave_dweller
	name                    = "Cave Dweller"