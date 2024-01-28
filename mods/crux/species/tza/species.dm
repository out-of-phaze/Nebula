/datum/appearance_descriptor/age/tza
	chargen_min_index = 3
	chargen_max_index = 6
	standalone_value_descriptors = list(
		"a larva"        = 1,
		"a nymph"        = 2,
		"a juvenile"     = 3,
		"an adolescent"  = 5,
		"a young adult"  = 12,
		"a full adult"   = 20,
		"senescent"      = 35
	)

/decl/species/tza
	name                   = SPECIES_TZA
	name_plural            = SPECIES_TZA
	show_ssd               = "in torpor"
	base_prosthetics_model = null
	available_bodytypes    = list(/decl/bodytype/tza)
	description            = "Bugs!"
	flesh_color            = COLOR_PALE_PINK
	move_trail             = /obj/effect/decal/cleanable/blood/tracks/snake
	blood_types            = list(/decl/blood_type/hemolymph)
	speech_chance          = 100
	age_descriptor         = /datum/appearance_descriptor/age/tza
	rarity_value           = 3
	gluttonous             = 2
	preview_outfit         = null

	sniff_message_3p = "waves their antennae."
	sniff_message_1p = "You wave your antennae, searching for scents."

	burn_mod      = 1.1
	brute_mod     = 1.1
	oxy_mod       = 0.8
	toxins_mod    = 0.8
	radiation_mod = 0.8

	available_pronouns = list(
		/decl/pronouns,
		/decl/pronouns/neuter/person,
		/decl/pronouns/female
	)

	speech_sounds = list(
		'mods/crux/sounds/speech/bug1.ogg',
		'mods/crux/sounds/speech/bug2.ogg',
		'mods/crux/sounds/speech/bug3.ogg',
		'mods/crux/sounds/speech/bug4.ogg',
		'mods/crux/sounds/speech/bug5.ogg',
		'mods/crux/sounds/speech/bug6.ogg'
	)

	species_flags = SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_MINOR_CUT
	spawn_flags   = SPECIES_CAN_JOIN

	unarmed_attacks = list(
		/decl/natural_attack/claws/strong/gloves,
		/decl/natural_attack/bite/sharp
	)

	force_cultural_info = list(
		TAG_CULTURE =   /decl/cultural_info/culture/crux/tza,
		TAG_HOMEWORLD = /decl/cultural_info/location/crux/tza,
		TAG_FACTION =   /decl/cultural_info/faction/crux/tza,
		TAG_RELIGION =  /decl/cultural_info/religion/other
	)

	appearance_descriptors = list(
		/datum/appearance_descriptor/height      = 0.8,
		/datum/appearance_descriptor/body_length = 0.6
	)

	pain_emotes_with_pain_level = list(
		list(/decl/emote/pheromone/pain, /decl/emote/pheromone/fear) = 40
	)

/decl/species/tza/Initialize()
	default_emotes |= list(
		/decl/emote/pheromone/pain,
		/decl/emote/pheromone/fear,
		/decl/emote/pheromone/calm,
		/decl/emote/pheromone/storm,
		/decl/emote/pheromone/flood,
		/decl/emote/pheromone/newsisters,
		/decl/emote/pheromone/foodgood,
		/decl/emote/pheromone/foodbad,
		/decl/emote/pheromone/happy,
		/decl/emote/pheromone/sad,
		/decl/emote/pheromone/custom
	)
	. = ..()

/decl/species/tza/handle_autohiss(message, decl/language/lang, mode)
	if(autohiss_exempt && (lang.name in autohiss_exempt))
		return message
	. = ""
	var/upperset = prob(50)
	var/caseperiod = rand(2,10)
	var/khxxted = FALSE
	for(var/i = 1 to length(message))
		var/add_char = message[i]
		if(!khxxted && prob(25) && (i == 1 || add_char == "," || add_char == "."))
			var/khxxt = ""
			khxxted = prob(25)
			if(i != 1)
				khxxt += " "
			khxxt += "k"
			if(prob(66))
				for(var/j = 1 to rand(2,3))
					khxxt += "h"
			for(var/j = 1 to rand(1,3))
				khxxt += "x"
			for(var/j = 1 to rand(1,3))
				khxxt += "t"
			if(i == 1)
				khxxt += " "
			add_char = "[khxxt][add_char]"
		if(upperset)
			add_char = uppertext(add_char)
		caseperiod--
		if(caseperiod <= 0)
			caseperiod = rand(2,10)
			upperset = prob(33)
		if((add_char in global.alphabet_no_vowels) && prob(15))
			for(var/j = 1 to rand(2,4))
				. += add_char
		. += add_char
	. = capitalize(trim(.))
