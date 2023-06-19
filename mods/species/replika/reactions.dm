/decl/chemical_reaction/quickfoam
	name = "Quick-Set Polyurethane Repair Foam"
	result = /decl/material/solid/plastifoam/quick
	// one 5u repair patch should turn a full repair spray into a full repair spray+
	required_reagents = list(/decl/material/solid/plastifoam = 3, /decl/material/solid/koagulant_k = 1)
	result_amount = 3 // you don't get extra, sorry

// Plastic in these recipes are a stand-in for plasticide, which is unfortunately super rare at the moment.
/decl/chemical_reaction/plastifoam
	name = "Polyurethane Repair Foam"
	result = /decl/material/solid/plastifoam
	required_reagents = list(/decl/material/solid/plastic = 3, /decl/material/liquid/foaming_agent = 1, /decl/material/liquid/acid/polyacid = 1)
	result_amount = 5

/decl/chemical_reaction/koagulant_k
	name = "Coagulant K"
	result = /decl/material/solid/koagulant_k
	// Quartz here is a stand-in for silica. If we ever add that, replace it.
	required_reagents = list(/decl/material/solid/plastic = 1, /decl/material/liquid/brute_meds = 1, /decl/material/solid/quartz = 1)
	result_amount = 3

/decl/chemical_reaction/klstim_n
	name = "Circulatory Stimulant N"
	result = /decl/material/liquid/klstim_n
	required_reagents = list(/decl/material/solid/plastic = 1, /decl/material/liquid/adrenaline = 1, /decl/material/liquid/acid = 1)
	result_amount = 3
