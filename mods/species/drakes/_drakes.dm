#define SPECIES_GRAFADREKA  "Grafadreka"
#define BODYTYPE_GRAFADREKA "drake body"

/decl/modpack/grafadreka
	name = "Drake Species"

/obj/item/storage/backpack/setup_sprite_sheets()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_GRAFADREKA, 'mods/species/drakes/icons/clothing/backpack.dmi')

/obj/item/card/id/setup_sprite_sheets()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_GRAFADREKA, 'mods/species/drakes/icons/clothing/id.dmi')

/mob/living/carbon/human/grafadreka/Initialize(mapload)
	. = ..(mapload, SPECIES_GRAFADREKA)
