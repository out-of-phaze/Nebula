/decl/sprite_accessory/hair/replika
	abstract_type = /decl/sprite_accessory/hair/replika
	species_allowed = list(/decl/species/replika::uid)

/decl/sprite_accessory/hair/bald/Initialize()
	. = ..()
	LAZYADD(bodytypes_denied, subtypesof(/decl/bodytype/replika))

/decl/sprite_accessory/hair/replika/eulr
	name = "EULR hair"
	icon_state = "hair_volaju"
	accessory_flags = HAIR_LOSS_VULNERABLE | HAIR_TIEABLE
	bodytypes_allowed = list(/decl/bodytype/replika/eulr)
	uid = "hair_eulr"

/decl/sprite_accessory/hair/replika/arar
	name = "ARAR hair"
	icon_state = "hair_longfringe"
	accessory_flags = HAIR_LOSS_VULNERABLE | HAIR_TIEABLE
	bodytypes_allowed = list(/decl/bodytype/replika/arar)
	uid = "hair_arar"

/decl/sprite_accessory/hair/replika/lstr
	name = "LSTR hair"
	icon = 'mods/species/replika/icons/lstr/hair.dmi'
	icon_state = "hair_lstr_apmk"
	bodytypes_allowed = list(/decl/bodytype/replika/lstr)
	uid = "hair_lstr"

/decl/sprite_accessory/hair/replika/star
	name = "STAR hair"
	icon = 'mods/species/replika/icons/star/hair.dmi'
	icon_state = "hair_star"
	bodytypes_allowed = list(/decl/bodytype/replika/star)
	uid = "hair_star"

/decl/sprite_accessory/hair/replika/klbr
	name = "KLBR hair"
	icon = 'mods/species/replika/icons/klbr/hair.dmi'
	icon_state = "hair_klbr"
	bodytypes_allowed = list(/decl/bodytype/replika/klbr)
	uid = "hair_klbr"
