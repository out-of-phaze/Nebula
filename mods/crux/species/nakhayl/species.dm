/datum/appearance_descriptor/age/nakhayl
	standalone_value_descriptors = list(
		"an infant"     = 1,
		"a toddler"     = 3,
		"a child"       = 7,
		"an adolescent" = 13,
		"a young adult" = 18,
		"an adult"      = 30,
		"middle-aged"   = 55,
		"aging"         = 80,
		"elderly"       = 140
	)

/decl/species/nakhayl
	name                   = SPECIES_NAKHAYL
	name_plural            = "Ha-Nakhay"
	base_prosthetics_model = null
	description            = "Gnolls!"
	hidden_from_codex      = FALSE
	age_descriptor         = /datum/appearance_descriptor/age/nakhayl
	available_bodytypes    = list(/decl/bodytype/nakhayl)
	preview_outfit         = /decl/hierarchy/outfit/job/generic/engineer
	spawn_flags            = SPECIES_CAN_JOIN
	flesh_color            = "#ae7d32"
	hunger_factor          = DEFAULT_HUNGER_FACTOR * 1.2
	gluttonous             = GLUT_TINY
	move_trail             = /obj/effect/decal/cleanable/blood/tracks/paw

	unarmed_attacks = list(
		/decl/natural_attack/stomp,
		/decl/natural_attack/kick,
		/decl/natural_attack/punch,
		/decl/natural_attack/bite/sharp
	)

	available_cultural_info = list(
		TAG_HOMEWORLD = list(
			/decl/cultural_info/location/crux/nakhayl,
			/decl/cultural_info/location/crux,
			/decl/cultural_info/location/other
		),
		TAG_FACTION =   list(
			/decl/cultural_info/faction/crux/nakhayl,
			/decl/cultural_info/faction/crux,
			/decl/cultural_info/faction/other
		),
		TAG_CULTURE =   list(
			/decl/cultural_info/culture/crux/nakhayl,
			/decl/cultural_info/culture/crux,
			/decl/cultural_info/culture/other
		),
		TAG_RELIGION =  list(
			/decl/cultural_info/religion/other
		)
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

/decl/species/nakhayl/handle_additional_hair_loss(var/mob/living/carbon/human/H, var/defer_body_update = TRUE)
	. = H?.set_skin_colour(rgb(189, 171, 143))
