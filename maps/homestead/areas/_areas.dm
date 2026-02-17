/area/homestead
	abstract_type = /area/homestead
	allow_xenoarchaeology_finds = FALSE
	icon = 'maps/homestead/areas/icons.dmi'
	icon_state = "area"
	base_turf = /turf/floor/rock/basalt
	fishing_failure_prob = 5
	fishing_results = list(
		/mob/living/simple_animal/aquatic/fish               = 10,
		/mob/living/simple_animal/aquatic/fish/grump         = 10,
		/obj/item/mollusc                                    = 5,
		/obj/item/mollusc/barnacle/fished                    = 5,
		/obj/item/mollusc/clam/fished/pearl                  = 3,
		/obj/item/trash/mollusc_shell/clam                   = 1,
		/obj/item/trash/mollusc_shell/barnacle               = 1,
		/obj/item/remains/mouse                              = 1,
		/obj/item/remains/lizard                             = 1,
		/obj/item/stick                                      = 1,
		/obj/item/trash/mollusc_shell                        = 1,
	)
	sound_env = GENERIC
	ambience = list()

/area/homestead/outside
	name = "\improper Grasslands"
	color = COLOR_GREEN
	is_outside = OUTSIDE_YES
	sound_env = PLAIN
	ambience = list(
		'sound/effects/wind/wind_2_1.ogg',
		'sound/effects/wind/wind_2_2.ogg',
		'sound/effects/wind/wind_3_1.ogg',
		'sound/effects/wind/wind_4_1.ogg',
		'sound/effects/wind/wind_4_2.ogg',
		'sound/effects/wind/wind_5_1.ogg'
	)
	description = "Birds and insects call from the grasses, and a cool wind gusts from across the river."
	area_blurb_category = /area/homestead/outside
	interior_ambient_light_modifier = -0.4
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_BACKGROUND
