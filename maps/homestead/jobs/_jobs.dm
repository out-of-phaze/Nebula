/datum/map/homestead
	allowed_jobs = list(
		/datum/job/homestead/visitor/traveller,
		/datum/job/homestead/visitor/traveller/learned,
		/datum/job/homestead/local/homesteader,
		/datum/job/homestead/local/homesteader/migrant
	)
	default_job_type = /datum/job/homestead/local/homesteader/migrant
	default_department_type = /decl/department/homestead/locals
	species_to_job_whitelist = list(
		/decl/species/grafadreka = list(
			/datum/job/homestead/visitor/traveller
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
	max_skill               = list()
	skill_points            = 24
