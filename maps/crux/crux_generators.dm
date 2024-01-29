/datum/random_map/noise/crux
	abstract_type = /datum/random_map/noise/crux
	smoothing_iterations = 3
	target_turf_type = /turf/unsimulated/mask
	smooth_single_tiles = TRUE

/datum/random_map/noise/crux/seafloor
	descriptor = "Novika seafloor (roundstart)"
	target_turf_type = /turf/exterior/seafloor/flooded

/datum/random_map/noise/crux/seafloor/get_appropriate_path(var/value)
	var/val = min(9,max(0,round((value/cell_range)*10)))
	switch(val)
		if(6)
			return /turf/exterior/clay/flooded
		if(7 to 9)
			return /turf/exterior/mud/flooded

/datum/random_map/noise/crux/seafloor/get_additional_spawns(var/value, var/turf/T)
	var/val = min(9,max(0,round((value/cell_range)*10)))
	if(isnull(val)) val = 0
	switch(val)
		if(3,4)
			if(prob(10))
				new /obj/structure/flora/seaweed(T)
			else if(prob(10))
				new /obj/structure/flora/seaweed/mid(T)
		if(5)
			if(prob(20))
				new /obj/structure/flora/seaweed(T)
			else if(prob(20))
				new /obj/structure/flora/seaweed/mid(T)
			else if(prob(60))
				new /obj/structure/flora/seaweed/large(T)
			else if(prob(10))
				new /obj/structure/flora/seaweed/glow(T)
		if(6)
			if(prob(20))
				new /obj/structure/flora/seaweed/mid(T)
			else if(prob(30))
				new /obj/structure/flora/seaweed/large(T)
			else if (prob(5))
				new /obj/structure/flora/seaweed/glow(T)
		if(7,9)
			if(prob(35))
				new /obj/structure/flora/seaweed/large(T)
			else if(prob(1))
				new /obj/structure/flora/seaweed/glow(T)

/datum/random_map/noise/crux/abyss
	descriptor = "Novika abyss (roundstart)"
	target_turf_type = /turf/exterior/mud/flooded

/datum/random_map/noise/crux/abyss/get_appropriate_path(var/value)
	var/val = min(9,max(0,round((value/cell_range)*10)))
	if(val > 7)
		return /turf/exterior/clay/flooded

/datum/random_map/noise/crux/grassland
	descriptor = "Crux grassland (roundstart)"

/datum/random_map/noise/crux/grassland/cleanup()
	..()
	// Round down to 1-9.
	for(var/x = 1, x <= limit_x, x++)
		for(var/y = 1, y <= limit_y, y++)
			var/current_cell = TRANSLATE_COORD(x,y)
			var/current_val = map[current_cell]
			map[current_cell] = min(9,max(0,round((current_val/cell_range)*10)))

/datum/random_map/noise/crux/grassland/get_appropriate_path(var/value)
	switch(value)
		if(0)
			return /turf/exterior/mud
		if(1 to 2)
			return /turf/exterior/dirt
		if(3 to 5)
			return /turf/exterior/grass
		if(6 to 9)
			return /turf/exterior/wildgrass

/datum/random_map/noise/crux/grassland/get_additional_spawns(var/value, var/turf/T)
	if(prob(60))
		return
	switch(value)
		if(1 to 2)
			if(prob(1))
				new /obj/structure/flora/bush/fernybush(T)
			else if(prob(1))
				new /obj/structure/flora/mushroom(T)
		if(3 to 4)
			if(prob(1))
				new /obj/structure/flora/bush/fernybush(T)
			else if(prob(1))
				new /obj/structure/flora/bush/sparsegrass(T)
			else if(prob(1))
				new /obj/structure/flora/mushroom(T)
		if(5 to 6)
			if(prob(1))
				new /obj/structure/flora/bush/sparsegrass(T)
			else if(prob(1))
				new /obj/structure/flora/bush/ppflowers(T)
			else if (prob(1))
				new /obj/structure/flora/bush/fernybush(T)
		if(7 to 8)
			if(prob(5))
				new /obj/structure/flora/tree/pine(T)
			else if(prob(1))
				new /obj/structure/flora/bush/ppflowers(T)
			else if(prob(1))
				new /obj/structure/flora/bush/fernybush(T)
			else if(prob(1))
				new /obj/structure/flora/bush/sparsegrass(T)

/datum/random_map/noise/crux/grassland/forest
	descriptor = "Novika forest (roundstart)"

/datum/random_map/noise/crux/grassland/forest/get_additional_spawns(var/value, var/turf/T)
	if(prob(25))
		return
	switch(value)
		if(0 to 5)
			if(value >= 3 && prob(5))
				new /obj/structure/flora/tree/pine(T)
				return
			if(prob(1))
				new /obj/structure/flora/bush/fernybush(T)
			else if(prob(1))
				new /obj/structure/flora/bush/sparsegrass(T)
			else if(prob(1))
				new /obj/structure/flora/mushroom(T)
		if(6 to 9)
			if(prob((value <= 7) ? 15 : 35))
				new /obj/structure/flora/tree/pine(T)
				return
			if(prob(1))
				new /obj/structure/flora/bush/ppflowers(T)
			else if(prob(1))
				new /obj/structure/flora/bush/fernybush(T)
			else if(prob(1))
				new /obj/structure/flora/bush/sparsegrass(T)

/datum/random_map/automata/cave_system/crux
	descriptor = "Novika dry caves (roundstart)"

/datum/random_map/automata/cave_system/crux/flooded
	descriptor = "Novika ocean caves (roundstart)"
	wall_type =  /turf/exterior/wall/flooded
	floor_type = /turf/exterior/mud/flooded
