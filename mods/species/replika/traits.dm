/decl/trait/build_references()
	. = ..()
	LAZYDISTINCTADD(blocked_species, /decl/species/replika::uid)

/decl/trait/replika
	abstract_type = /decl/trait/replika

/decl/trait/replika/build_references()
	. = ..()
	blocked_species = null
	permitted_species = list(/decl/species/replika::uid)

// Cosmetic/armour changes, different models of limb
/decl/trait/replika/customisation
	name = "Armored Chest"
	description = "Coming soon!"
	category = "Frame Customisation"

// Additional augments, organs, better armour, robomodules
/decl/trait/replika/upgrade
	name = "Upgraded Organ"
	description = "Coming soon!"
	category = "Upgrades"

// Various maluses
/decl/trait/replika/fault
	name = "Faulty Organ"
	description = "Coming soon!"
	category = "Faults"
