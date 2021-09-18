/datum/random_map/noise/ice_plain
	name = "ice plain"
	smoothing_iterations = 3
	target_turf_type = /turf/unsimulated/mask
	smooth_single_tiles = TRUE

/datum/random_map/noise/ice_plain/get_appropriate_path(var/value)
	switch(min(9,max(0,round((value/cell_range)*10))))
		if(1 to 4)
			return /turf/exterior/wall/ice
		if(8 to 9)
			return /turf/exterior/ice
	return /turf/exterior/snow

/datum/random_map/automata/cave_system/ice_sheet
	descriptor = "ice caves"
	wall_type =  /turf/exterior/wall/ice
	floor_type = /turf/exterior/ice
	target_turf_type = /turf/unsimulated/mask/flooded
	mineral_turf = /turf/exterior/wall/random/ice

/datum/random_map/automata/cave_system/ice_sheet/flooded
	descriptor = "flooded ice caves"
	floor_type = /turf/exterior/open/flooded
