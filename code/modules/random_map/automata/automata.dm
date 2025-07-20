#define CELL_ALIVE(VAL) (VAL == cell_live_value)
#define KILL_CELL(CELL, NEXT_MAP) NEXT_MAP[CELL] = cell_dead_value;
#define REVIVE_CELL(CELL, NEXT_MAP) NEXT_MAP[CELL] = cell_live_value;

/datum/random_map/automata
	descriptor = "generic caves"
	initial_wall_cell = 55
	var/iterations = 0               // Number of times to apply the automata rule.
	var/cell_live_value = WALL_CHAR  // Cell is alive if it has this value.
	var/cell_dead_value = FLOOR_CHAR // As above for death.
	var/cell_threshold = 5           // Cell becomes alive with this many live neighbors.

// Automata-specific procs and processing.
/datum/random_map/automata/generate_map()
	if (!islist(map))
		set_map_size()
	var/map_size = limit_x*limit_y
	// cache these for additional speed, since we're doing like 325k loops
	var/cell_live_value = src.cell_live_value
	var/cell_dead_value = src.cell_dead_value
	var/cell_threshold = src.cell_threshold
	var/list/next_map[map_size] // as an optimisation, we flip the buffers at the end to avoid reallocating each iteration
	var/old_buffer = map
	for(var/iter = 1 to iterations)
		var/count
		var/is_not_border_left
		var/is_not_border_right
		var/ilim_u
		var/ilim_d
		var/bottom_lim = map_size - limit_x

		for (var/x in 1 to limit_x)
			for(var/y in 1 to limit_y)
				count = 0
				var/mapcell = TRANSLATE_COORD(x, y)
				is_not_border_left = x > 1
				is_not_border_right = x < limit_x

				count += CELL_ALIVE(map[mapcell]) // Center row.
				count += (is_not_border_left && CELL_ALIVE(map[mapcell - 1]))
				count += (is_not_border_right && CELL_ALIVE(map[mapcell + 1]))

				if (mapcell > limit_x) // top row
					ilim_u = mapcell - limit_x
					count += CELL_ALIVE(map[ilim_u])
					count += (is_not_border_left && CELL_ALIVE(map[ilim_u - 1]))
					count += (is_not_border_right && CELL_ALIVE(map[ilim_u + 1]))

				if (mapcell <= bottom_lim) // bottom row
					ilim_d = mapcell + limit_x
					count += CELL_ALIVE(map[ilim_d])
					count += (is_not_border_left && CELL_ALIVE(map[ilim_d - 1]))
					count += (is_not_border_right && CELL_ALIVE(map[ilim_d + 1]))

				next_map[mapcell] = (count >= cell_threshold) ? cell_live_value : cell_dead_value
				CHECK_TICK

		// flip the buffers to skip a list allocation
		map = next_map
		next_map = old_buffer

/datum/random_map/automata/get_additional_spawns(value, turf/T)
	return

#undef KILL_CELL
#undef REVIVE_CELL