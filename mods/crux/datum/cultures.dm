/decl/cultural_info/location/crux
	name = "Regional Eleostura"
	description = "You are from the region of Eleostura, either the city itself, or the rural settlements surrounding it."

/decl/cultural_info/faction/crux
	name = "Independent Novika"
	description = "You are one of, or a descendant of, the original Novika colonists."

/decl/cultural_info/culture/crux
	name = "Solar Migrant"
	description = "You were raised in the traditions of Old Earth, carried across the stars by the Novika colonists and adapted for the New World."

/datum/map/crux
	available_cultural_info = list(
		TAG_HOMEWORLD = list(
			/decl/cultural_info/location/crux,
			/decl/cultural_info/location/other
		),
		TAG_FACTION =   list(
			/decl/cultural_info/faction/crux,
			/decl/cultural_info/faction/other
		),
		TAG_CULTURE =   list(
			/decl/cultural_info/culture/crux,
			/decl/cultural_info/culture/other
		),
		TAG_RELIGION =  list(
			/decl/cultural_info/religion/other
		)
	)

	default_cultural_info = list(
		TAG_HOMEWORLD = /decl/cultural_info/location/crux,
		TAG_FACTION =   /decl/cultural_info/faction/crux,
		TAG_CULTURE =   /decl/cultural_info/culture/crux,
		TAG_RELIGION =  /decl/cultural_info/religion/other
	)
