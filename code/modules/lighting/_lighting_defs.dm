// This is the define used to calculate falloff.
#define LUM_FALLOFF(Cx,Cy,Tx,Ty,HEIGHT) (1 - CLAMP01(sqrt(((Cx) - (Tx)) ** 2 + ((Cy) - (Ty)) ** 2 + HEIGHT) / max(1, actual_range)))

#define LUM_FALLOFF_WITH_DIR_ADJACENCY(Cx, Cy, Tx, Ty, HEIGHT, EFFECTIVE_DISTANCE) ((1 - CLAMP01((sqrt(((Cx) - (Tx)) ** 2 + ((Cy) - (Ty)) ** 2 + HEIGHT) + (EFFECTIVE_DISTANCE)) / max(1, actual_range))))
// #define LUM_FALLOFF_WITH_DIR_ADJACENCY(Cx, Cy, Tx, Ty, HEIGHT, EFFECTIVE_DISTANCE) (min(LUM_FALLOFF(Cx, Cy, Tx, Ty, HEIGHT), (EFFECTIVE_DISTANCE)/3))
// I have a sneaking suspicion that the above is not correct, but these didn't seem to improve it any.
// #define LUM_FALLOFF_WITH_DIR_ADJACENCY(Cx, Cy, Tx, Ty, HEIGHT, EFFECTIVE_DISTANCE) (min(LUM_FALLOFF(Cx, Cy, Tx, Ty, HEIGHT), 1 - CLAMP01((EFFECTIVE_DISTANCE) / max(1, actual_range))))

// Macro that applies light to a new corner.
// It is a macro in the interest of speed, yet not having to copy paste it.
// If you're wondering what's with the backslashes, the backslashes cause BYOND to not automatically end the line.
// As such this all gets counted as a single line.
// The braces and semicolons are there to be able to do this on a single line.

#define APPLY_CORNER(C,now,Tx,Ty,hdiff)         \
	. = LUM_FALLOFF(C.x, C.y, Tx, Ty, hdiff) * light_power;    \
	var/OLD = effect_str[C];                 \
	effect_str[C] = .;                       \
	C.update_lumcount                        \
	(                                        \
		(. * lum_r) - (OLD * applied_lum_r), \
		(. * lum_g) - (OLD * applied_lum_g), \
		(. * lum_b) - (OLD * applied_lum_b), \
		now                                  \
	);

#define APPLY_CORNER_WITH_DIR_ADJACENCY(C,now,Tx,Ty,hdiff,effdir)         \
	. = LUM_FALLOFF_WITH_DIR_ADJACENCY(C.x, C.y, Tx, Ty, hdiff, effdir) * light_power;    \
	var/OLD = effect_str[C];                 \
	effect_str[C] = .;                       \
	C.update_lumcount                        \
	(                                        \
		(. * lum_r) - (OLD * applied_lum_r), \
		(. * lum_g) - (OLD * applied_lum_g), \
		(. * lum_b) - (OLD * applied_lum_b), \
		now                                  \
	);

// I don't need to explain what this does, do I?
#define REMOVE_CORNER(C,now)         \
	. = -effect_str[C];              \
	C.update_lumcount                \
	(                                \
		. * applied_lum_r,           \
		. * applied_lum_g,           \
		. * applied_lum_b,           \
		now                          \
	);

// Converts two Z levels into a height value for LUM_FALLOFF or HEIGHT_FALLOFF.
#define CALCULATE_CORNER_HEIGHT(ZA,ZB) (((max(ZA,ZB) - min(ZA,ZB)) + 1) * LIGHTING_HEIGHT * LIGHTING_Z_FACTOR)

// This expects the variables corner_height and effective_distance to exist.
#define APPLY_CORNER_BY_HEIGHT_WITH_DIR_ADJACENCY(now)    \
	if (C.z != Sz) {                                      \
		corner_height = CALCULATE_CORNER_HEIGHT(C.z, Sz); \
	}                                                     \
	else {                                                \
		corner_height = LIGHTING_HEIGHT;                  \
	}                                                     \
	APPLY_CORNER_WITH_DIR_ADJACENCY(C, now, Sx, Sy, corner_height, effective_distance);

#define APPLY_CORNER_BY_HEIGHT(now)                       \
	if (C.z != Sz) {                                      \
		corner_height = CALCULATE_CORNER_HEIGHT(C.z, Sz); \
	}                                                     \
	else {                                                \
		corner_height = LIGHTING_HEIGHT;                  \
	}                                                     \
	APPLY_CORNER(C, now, Sx, Sy, corner_height);
