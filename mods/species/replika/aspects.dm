/decl/aspect/build_references()
	. = ..()
	LAZYDISTINCTADD(blocked_species, SPECIES_REPLIKA)

/decl/aspect/replika/build_references()
	. = ..()
	blocked_species = null
	permitted_species = list(SPECIES_REPLIKA)

// Cosmetic/armour changes, different models of limb
/decl/aspect/replika/customisation
	name = "Armored Chest"
	desc = "Coming soon!"
	category = "Frame Customisation"

// Additional augments, organs, better armour, robomodules
/decl/aspect/replika/upgrade
	name = "Upgraded Organ"
	desc = "Coming soon!"
	category = "Upgrades"

// Various maluses
/decl/aspect/replika/fault
	name = "Faulty Organ"
	desc = "Coming soon!"
	category = "Faults"
