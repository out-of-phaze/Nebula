/datum/appearance_descriptor/age/grafadreka
	chargen_min_index = 2
	chargen_max_index = 6
	standalone_value_descriptors = list(
		"a hatchling" =     1,
		"an juvenile" =     2,
		"an adolescent" =   4,
		"an adult" =        6,
		"aging" =          20,
		"elderly" =        30
	)

/decl/species/grafadreka
	name = SPECIES_GRAFADREKA
	name_plural = SPECIES_GRAFADREKA
	description = "The reclusive grafadreka (Icelandic, lit. 'digging dragon'), also known as the snow drake, is a large reptillian pack predator similar in size and morphology to old Earth hyenas. \
	They commonly dig shallow dens in dirt, snow or foliage, sometimes using them for concealment prior to an ambush. \
	Biological cousins to the elusive kururak, they have heavy, low-slung bodies and powerful jaws suited to hunting land prey rather than fishing. \
	Colonization and subsequent expansion have displaced many populations from their tundral territories into colder areas; as a result, their diet of Sivian prey animals has pivoted to a diet of giant spider meat."
	available_bodytypes = list(
		/decl/bodytype/quadruped/grafadreka
	)
	base_external_prosthetics_model = null // no robolimbs for dogs
	preview_outfit = null                  // no pants for dogs
	snow_slowdown_mod = -0.5
	age_descriptor = /datum/appearance_descriptor/age/grafadreka
	available_pronouns = list(
		/decl/pronouns,
		/decl/pronouns/neuter,
		/decl/pronouns/male,
		/decl/pronouns/female
	)
	unarmed_attacks = list(
		/decl/natural_attack/bite/sharp,
		/decl/natural_attack/claws/strong
	)
	available_cultural_info = list(
		TAG_CULTURE   = list(/decl/cultural_info/culture/grafadreka),
		TAG_HOMEWORLD = list(/decl/cultural_info/location/grafadreka),
		TAG_FACTION   = list(/decl/cultural_info/faction/grafadreka),
		TAG_RELIGION  = list(/decl/cultural_info/religion/grafadreka)
	)
	force_cultural_info = list(
		TAG_CULTURE   = /decl/cultural_info/culture/grafadreka,
		TAG_HOMEWORLD = /decl/cultural_info/location/grafadreka,
		TAG_FACTION   = /decl/cultural_info/faction/grafadreka,
		TAG_RELIGION  = /decl/cultural_info/religion/grafadreka
	)
	species_hud = /datum/hud_data/grafadreka

/datum/hud_data/grafadreka
	inventory_slots = list(
		/datum/inventory_slot/head/grafadreka,
		/datum/inventory_slot/back/grafadreka,
		/datum/inventory_slot/id/grafadreka
	)

/datum/inventory_slot/head/grafadreka
	ui_loc = ui_shoes
/datum/inventory_slot/back/grafadreka
	ui_loc = ui_oclothing
/datum/inventory_slot/id/grafadreka
	ui_loc = ui_mask