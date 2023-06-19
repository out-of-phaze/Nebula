// CHEMICALS
/decl/chemical_reaction/karmotrine
	name = "Karmotrine"
	result = /decl/material/liquid/ethanol/karmotrine
	required_reagents = list(/decl/material/liquid/acid = 1, /decl/material/liquid/fuel/hydrazine = 1, /decl/material/solid/phosphorus = 1)
	result_amount = 3

/decl/chemical_reaction/adelhyde
	name = "Adelhyde"
	result = /decl/material/liquid/blendable/adelhyde
	required_reagents = list(/decl/material/solid/carbon = 1, /decl/material/solid/potassium = 1, /decl/material/solid/organic/skin/lizard = 1)
	result_amount = 3

/decl/chemical_reaction/powdered_delta
	name = "Powdered Delta"
	result = /decl/material/liquid/blendable/powdered_delta
	required_reagents = list(/decl/material/liquid/surfactant = 1, /decl/material/liquid/acid/hydrochloric = 1, /decl/material/liquid/acetone = 1)
	result_amount = 3

/decl/chemical_reaction/concentrated_flanergide
	name = "Concentrated Flanergide"
	result = /decl/material/liquid/capsaicin/condensed/flanergide
	required_reagents = list(/decl/material/liquid/antiseptic = 1, /decl/material/gas/ammonia = 1, /decl/material/liquid/tar = 1)
	result_amount = 3

/decl/chemical_reaction/flanergide
	name = "Flanergide Dilution"
	result = /decl/material/liquid/capsaicin/flanergide
	required_reagents = list(/decl/material/liquid/capsaicin/condensed/flanergide = 1, /decl/material/liquid/water = 9)
	result_amount = 10
	maximum_temperature = T100C

/decl/chemical_reaction/instant_age
	name = "Insta-Age"
	result = /decl/material/solid/instant_age
	required_reagents = list(/decl/material/solid/organic/bone/cartilage = 1, /decl/material/liquid/acid/polyacid = 1, /decl/material/liquid/acetone)
	result_amount = 3

// AGING
/decl/chemical_reaction/adelhyde_aging
	name = "Adelhyde Aging"
	result = /decl/material/liquid/blendable/adelhyde/aged
	required_reagents = list(
		/decl/material/liquid/blendable/adelhyde = 1
	)
	catalysts = list(
		/decl/material/solid/instant_age = 1
	)
	result_amount = 1

/decl/chemical_reaction/bronson_aging
	name = "Bronson Extract Aging"
	result = /decl/material/liquid/blendable/bronson_extract/aged
	required_reagents = list(
		/decl/material/liquid/blendable/bronson_extract = 1
	)
	catalysts = list(
		/decl/material/solid/instant_age = 1
	)
	result_amount = 1

// If you use exactly 1u, it'll be used up after aging all the ingredients in the drink.
/decl/chemical_reaction/instant_age_consumption
	name = "Adelhyde Insta-Age Consumption"
	result = /decl/material/liquid/blendable/adelhyde/aged
	required_reagents = list(
		/decl/material/liquid/blendable/adelhyde/aged = 1,
		/decl/material/solid/instant_age = 1
	)
	hidden_from_codex = TRUE
	result_amount = 1
	mix_message = null

/decl/chemical_reaction/instant_age_consumption/bronson
	name = "Bronson Extract Insta-Age Consumption"
	result = /decl/material/liquid/blendable/bronson_extract/aged
	required_reagents = list(
		/decl/material/liquid/blendable/bronson_extract/aged = 1,
		/decl/material/solid/instant_age = 1
	)
	hidden_from_codex = TRUE
	inhibitors = list(
		/decl/material/liquid/blendable/adelhyde/aged // default to adelhyde to avoid splitting it and leaving some left over
	)