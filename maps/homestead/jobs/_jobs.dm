/datum/map/homestead
	allowed_jobs = list(
		/datum/job/homestead/visitor/traveller,
		/datum/job/homestead/visitor/traveller/learned,
		/datum/job/homestead/visitor/beggar_knight,
		/datum/job/homestead/local/miner,
		/datum/job/homestead/local/herbalist,
		/datum/job/homestead/local/forester,
		/datum/job/homestead/caves/dweller,
		/datum/job/homestead/visitor/traveller/cleric
	)
	default_job_type = /datum/job/homestead/visitor/traveller
	default_department_type = /decl/department/homestead/visitors
	species_to_job_whitelist = list(
		/decl/species/grafadreka = list(
			/datum/job/homestead/caves/dweller,
			/datum/job/homestead/visitor/traveller
		)
	)
	job_to_species_blacklist = list(
		/datum/job/homestead/caves/dweller = list(
			/decl/species/human,
			/decl/species/hnoll
		),
	)
	species_to_job_blacklist = list(
		/decl/species/kobaloi = list(
			/datum/job/homestead/visitor/beggar_knight,
			/datum/job/homestead/visitor/traveller/cleric
		)
	)

/decl/department/homestead
	abstract_type           = /decl/department/homestead
	noun                    = "faction"
	noun_adj                = "faction"
	announce_channel        = null

/datum/job/homestead
	abstract_type           = /datum/job/homestead
	hud_icon_state          = "hudblank"
	department_types        = list(
		/decl/department/homestead/locals
	)
	min_skill               = list()
	// if you consider adding something like literacy to this list to make it rarer/more exclusive
	// consider making the higher levels cost more points instead
	max_skill               = list(
		SKILL_CHEMISTRY     = SKILL_BASIC, // this is the domain of the herbalist
	)
	skill_points            = 20
