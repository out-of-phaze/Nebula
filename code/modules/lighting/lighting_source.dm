// This is where the fun begins.
// These are the main datums that emit light.

/datum/light_source
	var/atom/top_atom        // The atom we're emitting light from (for example a mob if we're from a flashlight that's being held).
	var/atom/source_atom     // The atom that we belong to.

	var/turf/source_turf // The turf under the above.
	var/turf/pixel_turf  // The turf the top_atom _appears_ to be on
	var/light_power      // Intensity of the emitter light.
	var/light_range      // The range of the emitted light.
	var/light_color      // The colour of the light, string, decomposed by parse_light_color()
	var/light_angle      // The light's emission angle, in degrees.

	// Variables for keeping track of the colour.
	var/lum_r
	var/lum_g
	var/lum_b

	// The lumcount values used to apply the light.
	var/tmp/applied_lum_r
	var/tmp/applied_lum_g
	var/tmp/applied_lum_b

	// Variables used to keep track of the atom's angle.
	var/tmp/limit_a_x       // The first test point's X coord for the light cone.
	var/tmp/limit_a_y       // The first test point's Y coord for the light cone.
	var/tmp/limit_b_x       // The second test point's X coord for the light cone.
	var/tmp/limit_b_y       // The second test point's Y coord for the light cone.
	// These are used specifically for filtering, which is slightly larger to improve falloff.
	var/tmp/filter_a_x      // The first test point's x coord for the filter cone.
	var/tmp/filter_a_y      // The first test point's y coord for the filter cone.
	var/tmp/filter_b_x      // The second test point's x coord for the filter cone.
	var/tmp/filter_b_y      // The second test point's y coord for the filter cone.
	var/tmp/cached_origin_x // The last known X coord of the origin.
	var/tmp/cached_origin_y // The last known Y coord of the origin.
	var/tmp/old_direction   // The last known direction of the origin.
	var/tmp/test_x_offset   // How much the X coord should be offset due to direction.
	var/tmp/test_y_offset   // How much the Y coord should be offset due to direction.
	var/tmp/facing_opaque = FALSE

	var/list/datum/lighting_corner/effect_str     // List used to store how much we're affecting corners.
	var/list/turf/affecting_turfs

	var/applied = FALSE // Whether we have applied our light yet or not.

	var/needs_update = LIGHTING_NO_UPDATE

// This macro will only offset up to 1 tile, but anything with a greater offset is an outlier and probably should handle its own lighting offsets.
// Anything pixelshifted 16px or more will be considered on the next tile.
#define GET_APPROXIMATE_PIXEL_DIR(PX, PY) ((!(PX) ? 0 : (((PX) >= 16 ? EAST : ((PX) <= -16 ? WEST : 0)))) | (!(PY) ? 0 : ((PY) >= 16 ? NORTH : ((PY) <= -16 ? SOUTH : 0))))
#define UPDATE_APPROXIMATE_PIXEL_TURF var/px = isnull(top_atom.light_offset_x) ? top_atom.pixel_x : top_atom.light_offset_x; var/py = isnull(top_atom.light_offset_y) ? top_atom.pixel_y : top_atom.light_offset_y; var/_dir = GET_APPROXIMATE_PIXEL_DIR(px, py); pixel_turf = _dir ? (get_step(source_turf, _dir) || source_turf) : source_turf

// These macros are for dealing with the multi/solo split.
#define ADD_SOURCE(TARGET) if (!TARGET.light_source_multi && !TARGET.light_source_solo) { TARGET.light_source_solo = src; } else if (TARGET.light_source_solo) { TARGET.light_source_multi = list(TARGET.light_source_solo, src); TARGET.light_source_solo = null; } else { TARGET.light_source_multi += src }
#define REMOVE_SOURCE(TARGET) if (TARGET.light_source_solo == src) { TARGET.light_source_solo = null } else if (TARGET.light_source_multi) { TARGET.light_source_multi -= src; if (TARGET.light_source_multi.len == 1) { TARGET.light_source_solo = TARGET.light_source_multi[1]; TARGET.light_source_multi = null; } }

/datum/light_source/New(atom/owner, atom/top)
	SSlighting.total_lighting_sources += 1
	source_atom = owner // Set our new owner.

	ADD_SOURCE(source_atom)

	top_atom = top
	if (top_atom != source_atom)
		ADD_SOURCE(top_atom)

	source_turf = top_atom
	UPDATE_APPROXIMATE_PIXEL_TURF
	light_power = source_atom.light_power
	light_range = source_atom.light_range
	light_color = source_atom.light_color
	light_angle = source_atom.light_wedge

	parse_light_color()

	update()

// Kill ourselves.
/datum/light_source/Destroy(force)
	SSlighting.total_lighting_sources -= 1

	remove_lum()
	if (source_atom)
		REMOVE_SOURCE(source_atom)

	if (top_atom)
		REMOVE_SOURCE(top_atom)

	. = ..()
	if (!force)
		return QDEL_HINT_IWILLGC

#ifdef USE_INTELLIGENT_LIGHTING_UPDATES
// Picks either scheduled or instant updates based on current server load.
#define INTELLIGENT_UPDATE(level)                      \
	var/_should_update = needs_update == LIGHTING_NO_UPDATE; \
	if (needs_update < level) {                        \
		needs_update = level;                          \
	}                                                  \
	if (_should_update) {                              \
		if (world.tick_usage > Master.current_ticklimit || SSlighting.force_queued) {	\
			SSlighting.light_queue += src;              \
		}                                               \
		else {                                          \
			SSlighting.total_instant_updates += 1;      \
			update_corners(TRUE);                       \
			needs_update = LIGHTING_NO_UPDATE;          \
		}                                               \
	}
#else
#define INTELLIGENT_UPDATE(level)           \
	if (needs_update == LIGHTING_NO_UPDATE) \
		SSlighting.light_queue += src;      \
	if (needs_update < level)               \
		needs_update = level;
#endif

// This proc will cause the light source to update the top atom, and add itself to the update queue.
/datum/light_source/proc/update(atom/new_top_atom)
	// This top atom is different.
	if (new_top_atom && new_top_atom != top_atom)
		if(top_atom != source_atom) // Remove ourselves from the light sources of that top atom.
			REMOVE_SOURCE(top_atom)

		top_atom = new_top_atom

		if (top_atom != source_atom)
			ADD_SOURCE(top_atom)	// Add ourselves to the light sources of our new top atom.

	INTELLIGENT_UPDATE(LIGHTING_CHECK_UPDATE)

// Will force an update without checking if it's actually needed.
/datum/light_source/proc/force_update()
	INTELLIGENT_UPDATE(LIGHTING_FORCE_UPDATE)

// Will cause the light source to recalculate turfs that were removed or added to visibility only.
/datum/light_source/proc/vis_update()
	INTELLIGENT_UPDATE(LIGHTING_VIS_UPDATE)

// Decompile the hexadecimal colour into lumcounts of each perspective.
/datum/light_source/proc/parse_light_color()
	if (light_color)
		var/list/color_list = rgb2num(light_color)
		lum_r = color_list[1] / 255
		lum_g = color_list[2] / 255
		lum_b = color_list[3] / 255
	else
		lum_r = 1
		lum_g = 1
		lum_b = 1

#define POLAR_TO_CART_X(R,T) ((R) * cos(T))
#define POLAR_TO_CART_Y(R,T) ((R) * sin(T))
// The determinant of the vectors A and B.
// Mostly used in lighting code to determine whether B is counterclockwise (determinant > 0) or clockwise (determinant < 0) from A.
// To understand this, read the section of "Remark (Signed volumes)." in this textbook about 2x2 matrices.
// https://web.archive.org/web/20250227145100/https://textbooks.math.gatech.edu/ila/determinants-volumes.html
// tl;dr: det(limit_a, test) > 0 checks if test is left (counter-clockwise) of limit_a (the left edge),
// and det(limit_b, test) < 0 checks if test is right (clockwise) of limit_b (the right edge).
// you can also do det(test, limit_b) > 0 to check if limit_b is counter-clockwise of test, which is equivalent.
#define DETERMINANT(A_X,A_Y,B_X,B_Y) ((A_X)*(B_Y) - (A_Y)*(B_X))
/// Evaluates to TRUE if the point (TEST_X, TEST_Y) is clockwise from the line (0,0) to (BASIS_X, BASIS_Y).
#define IS_CLOCKWISE_FROM(BASIS_X, BASIS_Y, TEST_X, TEST_Y) (DETERMINANT(BASIS_X, BASIS_Y, TEST_X, TEST_Y) < 0)
/// Evaluates to TRUE if the point (TEST_X, TEST_Y) is counter-clockwise from the line (0,0) to (BASIS_X, BASIS_Y).
#define IS_COUNTER_CLOCKWISE_FROM(BASIS_X, BASIS_Y, TEST_X, TEST_Y) (DETERMINANT(BASIS_X, BASIS_Y, TEST_X, TEST_Y) > 0)
/// Compute signed perpendicular distance of test point (tx,ty) from line formed by (0, 0) (bx, by)
/// This is the determinant (signed area of the parallelogram) divided by the magnitude of the line.
#define DISTANCE_FROM_ORIGIN_LINE(BASIS_X,BASIS_Y,TEST_X,TEST_Y) (DETERMINANT(BASIS_X, BASIS_Y, TEST_X, TEST_Y)/sqrt((BASIS_X)**2 + (BASIS_Y)**2))
/// Compute signed perpendicular of point (px,py) from line formed by (ax, ay) (bx, by)
/// This just performs a transformation so that (origin_x, origin_y) is (0,0).
#define DISTANCE_FROM_LINE(ORIGIN_X, ORIGIN_Y, BASIS_X, BASIS_Y, TEST_X, TEST_Y) (DISTANCE_FROM_ORIGIN_LINE(BASIS_X - ORIGIN_X, BASIS_Y - ORIGIN_Y, TEST_X - ORIGIN_X, TEST_Y - ORIGIN_Y))
// This number serves purely to make sure that the endpoint used for the cone extends past the actual light range.
#define ARBITRARY_NUMBER 10

/datum/light_source/proc/regenerate_angle(ndir)
	old_direction = ndir

	var/turf/front = get_step(pixel_turf, old_direction)
	facing_opaque = (front && front.has_opaque_atom)

	cached_origin_x = test_x_offset = pixel_turf.x
	cached_origin_y = test_y_offset = pixel_turf.y

	if (facing_opaque)
		return

	var/limit_a_t
	var/limit_b_t
	var/filter_a_t
	var/filter_b_t

	// We have an isosceles triangle with orientation (90 - dir2angle(old_direction)) and angle light_angle.
	// We need to get the left and right edges.
	// We do this by halving the angle (because both originate from the midpoint)
	// and adding or subtracting it from an offset,
	// then later turning those angles into points.
	// by the way,
	// (test_x_offset, test_y_offset) = (pixel_turf.x + cos(90-dir2angle(old_direction)), pixel_turf.y + sin(90-dir2angle(old_direction)))
	// which might be useful if we ever switch this to using angles for orientation instead of dirs.
	var/angle = light_angle * 0.5
	var/filter_angle = min(angle + 5, 90) // add 5 degrees to each side (10 total) but don't go above 90 (180 total)
	var/offset = 90 - dir2angle(old_direction)
	limit_a_t = offset + angle
	limit_b_t = offset - angle
	filter_a_t = offset + filter_angle
	filter_b_t = offset - filter_angle
	// offset us by a total of 0.5 in each direction
	test_x_offset += sign(cos(offset)) * 0.5
	test_y_offset += sign(sin(offset)) * 0.5

	// Convert our angle + range into a vector.
	limit_a_x = POLAR_TO_CART_X(light_range, limit_a_t)
	limit_a_x = trunc(limit_a_x)
	limit_a_y = POLAR_TO_CART_Y(light_range, limit_a_t)
	limit_a_y = trunc(limit_a_y)
	limit_b_x = POLAR_TO_CART_X(light_range, limit_b_t)
	limit_b_x = trunc(limit_b_x)
	limit_b_y = POLAR_TO_CART_Y(light_range, limit_b_t)
	limit_b_y = trunc(limit_b_y)
	// Also a second set of vars for filtering.
	filter_a_x = POLAR_TO_CART_X(light_range + ARBITRARY_NUMBER, filter_a_t)
	filter_a_x = -trunc(-filter_a_x)
	filter_a_y = POLAR_TO_CART_Y(light_range + ARBITRARY_NUMBER, filter_a_t)
	filter_a_y = -trunc(-filter_a_y)
	filter_b_x = POLAR_TO_CART_X(light_range + ARBITRARY_NUMBER, filter_b_t)
	filter_b_x = -trunc(-filter_b_x)
	filter_b_y = POLAR_TO_CART_Y(light_range + ARBITRARY_NUMBER, filter_b_t)
	filter_b_y = -trunc(-filter_b_y)

#undef ARBITRARY_NUMBER
#undef POLAR_TO_CART_Y
#undef POLAR_TO_CART_X

/datum/light_source/proc/remove_lum(now = FALSE)
	applied = FALSE

	var/thing
	for (thing in affecting_turfs)
		var/turf/T = thing
		LAZYREMOVE(T.affecting_lights, src)

	affecting_turfs = null

	for (thing in effect_str)
		var/datum/lighting_corner/C = thing
		REMOVE_CORNER(C,now)

		LAZYREMOVE(C.affecting, src)

	effect_str = null

/datum/light_source/proc/recalc_corner(datum/lighting_corner/C, now = FALSE)
	LAZYINITLIST(effect_str)
	if (effect_str[C]) // Already have one.
		REMOVE_CORNER(C,now)
		effect_str[C] = 0

	var/actual_range = (light_angle && facing_opaque) ? light_range * LIGHTING_BLOCKED_FACTOR : light_range

	var/Sx = pixel_turf.x
	var/Sy = pixel_turf.y
	var/Sz = pixel_turf.z

	var/height = C.z == Sz ? LIGHTING_HEIGHT : CALCULATE_CORNER_HEIGHT(C.z, Sz)
	APPLY_CORNER(C, now, Sx, Sy, height)

	UNSETEMPTY(effect_str)

/datum/light_source/proc/update_corners(now = FALSE)
	var/update = FALSE

	if (QDELETED(source_atom))
		qdel(src)
		return

	if (source_atom.light_power != light_power)
		light_power = source_atom.light_power
		update = TRUE

	if (source_atom.light_range != light_range)
		light_range = source_atom.light_range
		update = TRUE

	if (!top_atom)
		top_atom = source_atom
		update = TRUE

	if (top_atom.loc != source_turf)
		source_turf = top_atom.loc
		UPDATE_APPROXIMATE_PIXEL_TURF
		update = TRUE

	if (!light_range || !light_power)
		qdel(src)
		return

	if (isturf(top_atom))
		if (source_turf != top_atom)
			source_turf = top_atom
			UPDATE_APPROXIMATE_PIXEL_TURF
			update = TRUE
	else if (top_atom.loc != source_turf)
		source_turf = top_atom.loc
		UPDATE_APPROXIMATE_PIXEL_TURF
		update = TRUE

	if (!source_turf)
		return	// Somehow we've got a light in nullspace, no-op.

	if (light_range && light_power && !applied)
		update = TRUE

	if (source_atom.light_color != light_color)
		light_color = source_atom.light_color
		parse_light_color()
		update = TRUE

	else if (applied_lum_r != lum_r || applied_lum_g != lum_g || applied_lum_b != lum_b)
		update = TRUE

	if (source_atom.light_wedge != light_angle)
		light_angle = source_atom.light_wedge
		update = TRUE

	if (light_angle)
		UPDATE_APPROXIMATE_PIXEL_TURF // expensive, but necessary to avoid weirdness. todo: track last offset and recalculate?
		var/ndir
		if (ismob(top_atom) && top_atom:facing_dir)
			ndir = top_atom:facing_dir
		else if(top_atom.light_dir)
			ndir = top_atom.light_dir
		else
			ndir = top_atom.dir

		if (old_direction != ndir)	// If our direction has changed, we need to regenerate all the angle info.
			regenerate_angle(ndir)
			update = TRUE
		else // Check if it was just a x/y translation, and update our vars without an regenerate_angle() call if it is.
			if (pixel_turf.x != cached_origin_x)
				test_x_offset += pixel_turf.x - cached_origin_x
				cached_origin_x = pixel_turf.x
				update = TRUE // do a full update rather than just a visibility update

			if (pixel_turf.y != cached_origin_y)
				test_y_offset += pixel_turf.y - cached_origin_y
				cached_origin_y = pixel_turf.y
				update = TRUE

			// We might be facing a wall now, or no longer facing one if we already were
			var/turf/front = get_step(pixel_turf, old_direction)
			var/new_fo = (front && front.has_opaque_atom)
			if (new_fo != facing_opaque)
				facing_opaque = new_fo
				regenerate_angle(ndir)
				// if this is triggered by an opacity change then needs_update is already set by vis_update()

	if (update)
		needs_update = LIGHTING_CHECK_UPDATE
	else if (needs_update == LIGHTING_CHECK_UPDATE)
		return	// No change.

	var/list/datum/lighting_corner/corners = list()
	var/list/turf/turfs                    = list()
	var/datum/lighting_corner/C
	var/turf/T
	var/list/Tcorners
	var/corner_height = LIGHTING_HEIGHT
	var/actual_range = (light_angle && facing_opaque) ? light_range * LIGHTING_BLOCKED_FACTOR : light_range
	var/test_x
	var/test_y
	var/corner

	// Disabling the cone check when facing an opaque atom simulates bouncing light off of the opaque atom.
	// Theoretically this could be modified to do something more complex in the future,
	// like taking into account material reflectiveness or having a backwards-facing cone.
	// For now this works well enough, and it's cheap too.
	var/should_check_cone = light_angle && !facing_opaque
	var/Sx = should_check_cone ? test_x_offset : pixel_turf.x // these are used by APPLY_CORNER_BY_HEIGHT
	var/Sy = should_check_cone ? test_y_offset : pixel_turf.y
	var/Sz = pixel_turf.z

	// we use pixel_turf for light strength
	// but source_turf for the actual origin point
	var/valid = FALSE
	FOR_DVIEW(T, ceil(actual_range), source_turf, 0) do
		// var/valid = QUAD_ALL
		// note that this uses the filter_ vars and not the limit_ vars
		if (should_check_cone)	// Directional lighting coordinate filter.
			valid = FALSE
			test_x = T.x - Sx
			test_y = T.y - Sy
			// check if the center is in the cone first
			if (IS_CLOCKWISE_FROM(filter_a_x, filter_a_y, test_x, test_y) && IS_COUNTER_CLOCKWISE_FROM(filter_b_x, filter_b_y, test_x, test_y)) // center is in cone
				valid = TRUE
			// center wasn't in cone, check corners
			else
				// Calculate each test corner.
				var/tx_p = test_x + 0.5
				var/tx_n = test_x - 0.5
				var/ty_p = test_y + 0.5
				var/ty_n = test_y - 0.5
				if (IS_CLOCKWISE_FROM(filter_a_x, filter_a_y, tx_p, ty_p) && IS_COUNTER_CLOCKWISE_FROM(filter_b_x, filter_b_y, tx_p, ty_p)) // ++ corner is in cone
					valid = TRUE
				else if (IS_CLOCKWISE_FROM(filter_a_x, filter_a_y, tx_p, ty_n) && IS_COUNTER_CLOCKWISE_FROM(filter_b_x, filter_b_y, tx_p, ty_n)) // +- corner is in cone
					valid = TRUE
				else if (IS_CLOCKWISE_FROM(filter_a_x, filter_a_y, tx_n, ty_n) && IS_COUNTER_CLOCKWISE_FROM(filter_b_x, filter_b_y, tx_n, ty_n)) // -- corner is in cone
					valid = TRUE
				else if (IS_CLOCKWISE_FROM(filter_a_x, filter_a_y, tx_n, ty_p) && IS_COUNTER_CLOCKWISE_FROM(filter_b_x, filter_b_y, tx_n, ty_p)) // -+ corner is in cone
					valid = TRUE

			if(!valid) // no turf corners are illuminated
				continue

		Tcorners = T.corners
		// These checks are inlined from generate_missing_corners. They must be kept in sync.
		if (TURF_IS_DYNAMICALLY_LIT_UNSAFE(T) || T.light_source_solo || T.light_source_multi || (T.z_flags & ZM_ALLOW_LIGHTING))
			if (!T.lighting_corners_initialised)
				T.lighting_corners_initialised = TRUE

				if (!Tcorners)
					T.corners = list(null, null, null, null)
					Tcorners = T.corners

				for (var/i = 1 to 4)
					if (Tcorners[i])
						continue

					Tcorners[i] = new /datum/lighting_corner(T, LIGHTING_CORNER_DIAGONAL[i], i)

		if (Tcorners && !T.has_opaque_atom)
			for (var/v in 1 to 4)
				if((corner = Tcorners[v]))
					corners[corner] = 0

		turfs += T

	// Upwards lights are handled at the corner level, so only search down.
	//  This is a do-while associated with the FOR_DVIEW above.
	while (T && (T.z_flags & ZM_ALLOW_LIGHTING) && (T = T.below))
	END_FOR_DVIEW

	LAZYINITLIST(affecting_turfs)

	var/list/L = turfs - affecting_turfs // New turfs, add us to the affecting lights of them.
	affecting_turfs += L
	for (T as anything in L)
		LAZYADD(T.affecting_lights, src)

	L = affecting_turfs - turfs // Now-gone turfs, remove us from the affecting lights.
	affecting_turfs -= L
	for (T as anything in L)
		LAZYREMOVE(T.affecting_lights, src)

	LAZYINITLIST(effect_str)
	if (needs_update == LIGHTING_VIS_UPDATE)
		for (C as anything in corners - effect_str) // newly added corners
			LAZYADD(C.affecting, src)
			if (!C.active)
				effect_str[C] = 0
				continue
			if(should_check_cone)
				test_x = C.x - Sx
				test_y = C.y - Sy
				// get the area outside the cone
				var/left_signed_area = DETERMINANT(limit_a_x, limit_a_y, test_x, test_y) // positive determinant -> counter-clockwise -> outside cone
				var/right_signed_area = -DETERMINANT(limit_b_x, limit_b_y, test_x, test_y) // positive determinant -> counter-clockwise -> in cone, so we invert sign
				if(left_signed_area > 0) // outside on the left
					// var/left_perpendicular_distance = left_signed_area / sqrt(limit_a_x**2 + limit_a_y**2)
					// var/left_perpendicular_distance_squared = (left_signed_area ** 2) / (limit_a_x**2 + limit_a_y**2)
					INIT_CORNER_BY_HEIGHT_WITH_OFFSET(now, left_signed_area * actual_range / 2)
					continue
				else if(right_signed_area > 0) // outside on the right
					// var/right_perpendicular_distance = right_signed_area / sqrt(limit_b_x**2 + limit_b_y**2)
					// var/right_perpendicular_distance_squared = (right_signed_area ** 2) / (limit_b_x**2 + limit_b_y**2)
					INIT_CORNER_BY_HEIGHT_WITH_OFFSET(now, right_signed_area * actual_range / 2)
					continue
			INIT_CORNER_BY_HEIGHT(now)
	else
		L = corners - effect_str
		for (C as anything in L)
			LAZYADD(C.affecting, src)
			if (!C.active)
				effect_str[C] = 0
				continue
			if(should_check_cone)
				test_x = C.x - Sx
				test_y = C.y - Sy
				// get the area outside the cone
				var/left_signed_area = DETERMINANT(limit_a_x, limit_a_y, test_x, test_y) // positive determinant -> counter-clockwise -> area outside cone
				var/right_signed_area = -DETERMINANT(limit_b_x, limit_b_y, test_x, test_y) // positive determinant -> counter-clockwise -> area in cone, so we invert sign
				if(left_signed_area > 0) // outside on the left
					// var/left_perpendicular_distance = left_signed_area / sqrt(limit_a_x**2 + limit_a_y**2)
					// var/left_perpendicular_distance_squared = (left_signed_area ** 2) / (limit_a_x**2 + limit_a_y**2)
					// world.log << "LEFT: [left_perpendicular_distance] / [left_signed_area] ([test_x], [test_y])"
					INIT_CORNER_BY_HEIGHT_WITH_OFFSET(now, left_signed_area * actual_range / 2)
					continue
				else if(right_signed_area > 0) // outside on the right
					// var/right_perpendicular_distance = right_signed_area / sqrt(limit_b_x**2 + limit_b_y**2)
					// var/right_perpendicular_distance_squared = (right_signed_area ** 2) / (limit_b_x**2 + limit_b_y**2)
					// world.log << "RIGHT: [right_perpendicular_distance] / [right_signed_area] ([test_x], [test_y])"
					INIT_CORNER_BY_HEIGHT_WITH_OFFSET(now, right_signed_area * actual_range / 2)
					continue
			INIT_CORNER_BY_HEIGHT(now)

		for (C as anything in corners - L)
			if (!C.active)
				effect_str[C] = 0
				continue
			if(should_check_cone)
				test_x = C.x - Sx
				test_y = C.y - Sy
				// get the area outside the cone
				var/left_signed_area = DETERMINANT(limit_a_x, limit_a_y, test_x, test_y) // positive determinant -> counter-clockwise -> outside cone
				var/right_signed_area = -DETERMINANT(limit_b_x, limit_b_y, test_x, test_y) // positive determinant -> counter-clockwise -> in cone, so we invert sign
				if(left_signed_area > 0) // outside on the left
					// var/left_perpendicular_distance = left_signed_area / sqrt(limit_a_x**2 + limit_a_y**2)
					// var/left_perpendicular_distance_squared = (left_signed_area ** 2) / (limit_a_x**2 + limit_a_y**2)
					APPLY_CORNER_BY_HEIGHT_WITH_OFFSET(now, left_signed_area * actual_range / 2)
					continue
				else if(right_signed_area > 0) // outside on the right
					// var/right_perpendicular_distance = right_signed_area / sqrt(limit_b_x**2 + limit_b_y**2)
					// var/right_perpendicular_distance_squared = (right_signed_area ** 2) / (limit_b_x**2 + limit_b_y**2)
					APPLY_CORNER_BY_HEIGHT_WITH_OFFSET(now, right_signed_area * actual_range / 2)
					continue
			APPLY_CORNER_BY_HEIGHT(now)

	L = effect_str - corners
	for (C as anything in L)
		REMOVE_CORNER(C, now)
		LAZYREMOVE(C.affecting, src)

	effect_str -= L

	applied_lum_r = lum_r
	applied_lum_g = lum_g
	applied_lum_b = lum_b

	UNSETEMPTY(effect_str)
	UNSETEMPTY(affecting_turfs)

#undef INTELLIGENT_UPDATE
#undef DETERMINANT
#undef GET_APPROXIMATE_PIXEL_DIR
#undef UPDATE_APPROXIMATE_PIXEL_TURF
