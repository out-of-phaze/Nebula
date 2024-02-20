//Initializes relatively late in subsystem init order.
SUBSYSTEM_DEF(misc_late)
	name = "Late Initialization"
	init_order = SS_INIT_MISC_LATE
	flags = SS_NO_FIRE
	var/list/turbolifts_to_open = list()
	var/list/turfs_to_refresh = list()

/datum/controller/subsystem/misc_late/Initialize()

	var/decl/asset_cache/asset_cache = GET_DECL(/decl/asset_cache)
	asset_cache.load()

	// This is gross but I'm not sure where else to handle it. Sorry.
	for(var/datum/turbolift/lift in turbolifts_to_open)
		if(!QDELETED(lift))
			lift.open_doors()
	turbolifts_to_open.Cut()
	// Ditto here. TODO: SSvis_contents?
	for(var/turf/turf_to_refresh in turfs_to_refresh)
		if(turf_to_refresh.changing_turf || !turf_to_refresh.queued_for_vis_contents_update)
			continue
		turf_to_refresh.refresh_vis_contents(force_no_queue = TRUE)
		CHECK_TICK
	turfs_to_refresh.Cut()
	. = ..()
