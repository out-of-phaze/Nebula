/datum/map/homestead/New()
	LAZYDISTINCTADD(area_coherency_test_exempted_root_areas, /area/homestead/outside)
	LAZYSET(apc_test_exempt_areas, /area/homestead, (NO_SCRUBBER|NO_VENT|NO_APC))
	..()
