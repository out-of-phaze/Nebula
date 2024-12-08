var/global/list/multi_point_spawns

/** Oh God. Forgive me for this.
* Given a random spawner subtype TYPE and a dummy list-typed variable LIST,
and a dummy accumulator variable TOTAL,
and an output list OUT,
and a weight WEIGHT,
add the expansion of TYPE's spawn_choices to OUT, with a weight of WEIGHT.
* The math here is really complicated, but the gist of it is:
* Every prior entry in OUT needs to be scaled by the square of the sum of weights in LIST.
* Then, for each value in LIST, we add weight * TOTAL to the associated entry in OUT.
* This preserves the relative weights.
* Example usage:
```
	spawnable_choices = list()
	var/list/temp_spawnables
	var/total_weight
	EXPAND_RANDOM_SPAWNER_LIST(/obj/random/maintenance/clean, temp_spawnables, total_weight, spawnable_choices, 5)
	EXPAND_RANDOM_SPAWNER_LIST(/obj/random/junk, temp_spawnables, total_weight, spawnable_choices, 4)
	EXPAND_RANDOM_SPAWNER_LIST(/obj/random/trash, temp_spawnables, total_weight, spawnable_choices, 4)
```
*/
#define EXPAND_RANDOM_SPAWNER_LIST(TYPE, LIST, TOTAL, OUT, WEIGHT) \
LIST = STATIC_CALL(##TYPE, spawn_choices); \
TOTAL = sparse_assoc_sum(LIST); \
for(var/entry in OUT) { \
	OUT[entry] *= TOTAL * TOTAL; \
}; \
for(var/entry in LIST) { \
	var/assoc_val = LIST[entry]; \
	var/weight = isnull(assoc_val) ? 1 : assoc_val; \
	OUT[entry] = weight * TOTAL; \
}