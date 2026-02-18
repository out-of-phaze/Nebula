/decl/department/homestead/locals
	name                    = "Locals"
	colour                  = "#40684a"
	display_color           = "#8cc4a8"

/datum/job/homestead/local
	abstract_type           = /datum/job/homestead/local
	department_types        = list(/decl/department/homestead/locals)

/datum/job/homestead/local/homesteader
	title                   = "Homesteader"
	description             = "You are a homesteader, a member of the original crew sent to establish this wilderness homestead."
	supervisors             = "the consequences of your actions"
	spawn_positions         = -1
	total_positions         = 0
	outfit_type             = /decl/outfit/job/homestead/homesteader
	alt_titles              = list(
		"Miner" = /decl/outfit/job/homestead/homesteader/miner,
		"Forester" = /decl/outfit/job/homestead/homesteader/forester,
		"Herbalist" = /decl/outfit/job/homestead/homesteader/herbalist
	)
	// you just get a ton of skills now
/* 	min_skill               = list(
		SKILL_HAULING       = SKILL_BASIC, // general physical activity
		SKILL_METALWORK     = SKILL_BASIC, // ore smelting, metallurgy
		SKILL_STONEMASONRY  = SKILL_BASIC, // experienced working with stone
		SKILL_SCULPTING     = SKILL_BASIC, // producing clay molds, firing pottery
		SKILL_BOTANY        = SKILL_BASIC, // growing and harvesting plants, trees, etc
		SKILL_MEDICAL       = SKILL_BASIC, // identifying illnesses and applying medicines
		SKILL_CHEMISTRY     = SKILL_BASIC, // processing plant extracts into tinctures, ointments, etc
		SKILL_HUSBANDRY     = SKILL_BASIC, // handling and caring for animals
		SKILL_COOKING       = SKILL_BASIC, // butchery
		SKILL_CARPENTRY     = SKILL_BASIC, // tree felling
	) */
	skill_points            = 30

/obj/abstract/landmark/start/homestead/homesteader
	name                    = "Homesteader"

/datum/job/homestead/local/homesteader/migrant
	title                   = "Migrant"
	description             = "You are a migrant, a late arrival to the homestead sent to bolster the ranks and provide specialisation."
	spawn_positions = 0
	total_positions = -1

/obj/abstract/landmark/start/homestead/homesteader/migrant
	name                    = "Homesteader Migrant"