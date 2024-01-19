/decl/sprite_accessory/hair/replika
	abstract_type = /decl/sprite_accessory/hair/replika
	species_allowed = list(SPECIES_REPLIKA)

/decl/sprite_accessory/hair/bald/accessory_is_available(mob/owner, decl/species/species, bodytype_flags, check_gender)
	return ..() && (species.name != SPECIES_REPLIKA)

/decl/sprite_accessory/hair/replika/eulr
	name = "EULR hair"
	icon = 'mods/species/replika/icons/eulr/hair.dmi'
	icon_state = "hair_eulr_apmk"
	accessory_flags = HAIR_LOSS_VULNERABLE | HAIR_TIEABLE
	uid = "hair_eulr"

/decl/sprite_accessory/hair/replika/arar
	name = "ARAR hair"
	icon = 'mods/species/replika/icons/arar/hair.dmi'
	icon_state = "hair_arar_apmk"
	accessory_flags = HAIR_LOSS_VULNERABLE | HAIR_TIEABLE
	uid = "hair_arar"

/decl/sprite_accessory/hair/replika/lstr
	name = "LSTR hair"
	icon = 'mods/species/replika/icons/lstr/hair.dmi'
	icon_state = "hair_lstr_apmk"
	uid = "hair_lstr"

/decl/sprite_accessory/hair/replika/star
	name = "STAR hair"
	icon = 'mods/species/replika/icons/star/hair.dmi'
	icon_state = "hair_star_apmk"
	uid = "hair_star"

/decl/sprite_accessory/hair/replika/klbr
	name = "KLBR hair"
	icon = 'mods/species/replika/icons/klbr/hair.dmi'
	icon_state = "hair_klbr_apmk"
	uid = "hair_klbr"
