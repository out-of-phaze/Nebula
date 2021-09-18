// Yes this is just the Australian Public Service, but in spaaace.
/datum/map/signal
	branch_types = list(
		/datum/mil_branch/signal_public_service
	)
	spawn_branch_types = list(
		/datum/mil_branch/signal_public_service
	)

/datum/mil_branch/signal_public_service
	name = "Puthiya Natu Department of Planetary Exploitation"
	name_short = "DPE"

	rank_types = list(
		/datum/mil_rank/pnps/ses3,
		/datum/mil_rank/pnps/ses2,
		/datum/mil_rank/pnps/ses1,
		/datum/mil_rank/pnps/el2,
		/datum/mil_rank/pnps/el1,
		/datum/mil_rank/pnps/pnps6,
		/datum/mil_rank/pnps/pnps5,
		/datum/mil_rank/pnps/pnps4,
		/datum/mil_rank/pnps/pnps3,
		/datum/mil_rank/pnps/pnps2,
		/datum/mil_rank/pnps/pnps1
	)

	spawn_rank_types = list(
		/datum/mil_rank/pnps/ses1,
		/datum/mil_rank/pnps/el2,
		/datum/mil_rank/pnps/el1,
		/datum/mil_rank/pnps/pnps6,
		/datum/mil_rank/pnps/pnps5,
		/datum/mil_rank/pnps/pnps4,
		/datum/mil_rank/pnps/pnps3,
		/datum/mil_rank/pnps/pnps2,
		/datum/mil_rank/pnps/pnps1
	)

	assistant_job = /datum/job/signal

/datum/mil_rank/pnps/grade()
	return sort_order

/datum/mil_rank/pnps/pnps1
	name = "Public Service 1"
	name_short = "PPS1"
	sort_order = 1

/datum/mil_rank/pnps/pnps2
	name = "Public Service 2"
	name_short = "PPS2"
	sort_order = 2

/datum/mil_rank/pnps/pnps3
	name = "Public Service 3"
	name_short = "PPS3"
	sort_order = 3

/datum/mil_rank/pnps/pnps4
	name = "Public Service 4"
	name_short = "PPS4"
	sort_order = 4

/datum/mil_rank/pnps/pnps5
	name = "Public Service 5"
	name_short = "PPS5"
	sort_order = 5

/datum/mil_rank/pnps/pnps6
	name = "Public Service 6"
	name_short = "PPS6"
	sort_order = 6

/datum/mil_rank/pnps/el1
	name = "Executive Level 1"
	name_short = "EL1"
	sort_order = 7

/datum/mil_rank/pnps/el2
	name = "Executive Level 2"
	name_short = "EL2"
	sort_order = 8

/datum/mil_rank/pnps/ses1
	name = "Senior Executive Service 1"
	name_short = "SES1"
	sort_order = 9

/datum/mil_rank/pnps/ses2
	name = "Senior Executive Service 2"
	name_short = "SES2"
	sort_order = 10

/datum/mil_rank/pnps/ses3
	name = "Senior Executive Service 3"
	name_short = "SES3"
	sort_order = 11
