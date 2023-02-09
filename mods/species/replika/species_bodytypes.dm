/decl/bodytype/replika
	abstract_type =         /decl/bodytype/replika
	name =                  "replika"
	bodytype_category =     BODYTYPE_HUMANOID
	limb_blend =            ICON_MULTIPLY
	var/nickname
	var/prosthetics_model = /decl/prosthetics_manufacturer/replika
	var/default_hair_style

/decl/bodytype/replika/proc/apply_model_organ_modifications(obj/item/organ/org)
	if(istype(org, /obj/item/organ/external))
		var/obj/item/organ/external/limb = org
		limb.robotize(prosthetics_model, FALSE, TRUE, /decl/material/solid/fiberglass, BODYTYPE_HUMANOID, SPECIES_REPLIKA)

/decl/bodytype/replika/eulr
	name =              "EULR"
	nickname =          "Eule"
	icon_base =         'mods/species/replika/icons/eulr/body.dmi'
	prosthetics_model = /decl/prosthetics_manufacturer/replika/eulr
	default_hair_style = /decl/sprite_accessory/hair/replika/eulr

/decl/bodytype/replika/arar
	name =              "ARAR"
	nickname =          "Ara"
	icon_base =         'mods/species/replika/icons/arar/body.dmi'
	prosthetics_model = /decl/prosthetics_manufacturer/replika/arar
	default_hair_style = /decl/sprite_accessory/hair/replika/arar
	inherent_verbs = list(/mob/living/proc/ventcrawl)

/decl/bodytype/replika/lstr
	name =              "LSTR"
	nickname =          "Elster"
	icon_base =         'mods/species/replika/icons/lstr/body.dmi'
	prosthetics_model = /decl/prosthetics_manufacturer/replika/lstr
	default_hair_style = /decl/sprite_accessory/hair/replika/lstr