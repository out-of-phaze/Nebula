/datum/appearance_descriptor/age/yulomnn
	standalone_value_descriptors = list(
		"an infant" =       1,
		"a toddler" =       3,
		"a child" =         7,
		"an adolescent" =  13,
		"a young adult" =  18,
		"an adult" =       25,
		"middle-aged" =    50,
		"aging" =         150,
		"elderly" =       260
	)

/decl/species/unathi
	name                     = SPECIES_YULOMNN
	name_plural              = SPECIES_YULOMNN
	description              = "Lizards!"
	skin_material            = /decl/material/solid/organic/skin/lizard
	gluttonous               = GLUT_TINY
	strength                 = STR_HIGH
	breath_pressure          = 18
	brute_mod                = 0.8
	blood_volume             = 800
	hunger_factor            = DEFAULT_HUNGER_FACTOR * 2
	age_descriptor           = /datum/appearance_descriptor/age/yulomnn
	body_temperature         = null // cold-blooded, implemented the same way nabbers do it
	spawn_flags              = SPECIES_CAN_JOIN | SPECIES_NO_ROBOTIC_INTERNAL_ORGANS
	flesh_color              = "#34af10"
	preview_outfit           = /decl/hierarchy/outfit/job/generic/doctor
	move_trail               = /obj/effect/decal/cleanable/blood/tracks/claw
	breathing_sound          = 'mods/crux/sounds/lizard_breathing.ogg'
	exertion_effect_chance   = 10
	exertion_hydration_scale = 1
	exertion_reagent_scale   = 1
	exertion_reagent_path    = /decl/material/liquid/lactate

	available_bodytypes = list(/decl/bodytype/yulomnn)
	unarmed_attacks = list(
		/decl/natural_attack/stomp,
		/decl/natural_attack/tail,
		/decl/natural_attack/claws,
		/decl/natural_attack/punch,
		/decl/natural_attack/bite/sharp
	)
	appearance_descriptors = list(
		/datum/appearance_descriptor/height = 1.25,
		/datum/appearance_descriptor/build =  1.25
		)
	default_emotes = list(
		/decl/emote/human/swish,
		/decl/emote/human/wag,
		/decl/emote/human/sway,
		/decl/emote/human/qwag,
		/decl/emote/human/fastsway,
		/decl/emote/human/swag,
		/decl/emote/human/stopsway
	)
	pain_emotes_with_pain_level = list(
		list(/decl/emote/audible/wheeze, /decl/emote/audible/roar, /decl/emote/audible/bellow, /decl/emote/audible/howl) = 80,
		list(/decl/emote/audible/grunt, /decl/emote/audible/groan, /decl/emote/audible/wheeze, /decl/emote/audible/hiss) = 50,
		list(/decl/emote/audible/grunt, /decl/emote/audible/groan, /decl/emote/audible/hiss) = 20,
	)
	exertion_emotes_biological = list(
		/decl/emote/exertion/biological,
		/decl/emote/exertion/biological/breath,
		/decl/emote/exertion/biological/pant
	)
