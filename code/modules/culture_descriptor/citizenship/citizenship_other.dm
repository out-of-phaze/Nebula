/decl/cultural_info/citizenship/other
	name = "Other Culture"
	description = "You are from one of the many small, relatively unknown cultures scattered across the galaxy."
	language = /decl/language/human/common
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign
	)

/decl/cultural_info/citizenship/stateless
	name = "Stateless"
	description = "Statelessness is an extremely uncommon occurance. Any stateless human or positronic in SolGov space is \
	automatically extended SolGov citizenship, as are stateless members of other species who cannot regain citizenship in their \
	homeworld. Most other interstellar states have comperable policies. As such, statelessness tends to be at least semi-voluntary, \
	standing in for allegience to a defunct or unrecognized government or representing a total rejection of all interstellar governments."
	economic_power = 0
	capital = "None"

/decl/cultural_info/citizenship/synthetic
	name = "Stateless Drone"
	description = "Drones are considered property in SolGov, and citizenships extended by the Almach Protectorate are not recognized. \
	Thus, statelessness is ubiqtuous for them."
	secondary_langs = list(
		/decl/language/machine,
		/decl/language/human/common,
		/decl/language/sign
	)

/decl/cultural_info/citizenship/synthetic/sanitize_cultural_name(new_name)
	return sanitize_name(new_name, allow_numbers = TRUE)
