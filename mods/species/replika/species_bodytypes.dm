/decl/bodytype/replika
	abstract_type =       /decl/bodytype/replika
	name =                "replika"
	bodytype_category =   BODYTYPE_HUMANOID
	limb_blend =          ICON_MULTIPLY
	modular_limb_tier =   MODULAR_BODYPART_CYBERNETIC
	body_flags =          0
	modifier_string =     "biosynthetic"
	material =            /decl/material/solid/fiberglass // todo: polyethylene
	base_eye_color =      COLOR_COMMAND_BLUE
	matter = list(
		/decl/material/solid/meat = MATTER_AMOUNT_SECONDARY // todo: make bioengineered meat toxic to non-replika?
	)
	override_limb_types = list(BP_HEAD = /obj/item/organ/external/head/replika)
	has_organ = list(
		BP_POSIBRAIN = /obj/item/organ/internal/posibrain/replika,
		BP_EYES =      /obj/item/organ/internal/eyes/robot/replika,
		BP_CELL =      /obj/item/organ/internal/cell,
		BP_HEART =     /obj/item/organ/internal/heart/replika,
		BP_LUNGS =     /obj/item/organ/internal/lungs/replika,
		BP_STOMACH =   /obj/item/organ/internal/stomach/replika,
	)
	vital_organs = list(
		BP_POSIBRAIN,
		BP_CELL
	)
	var/nickname

/decl/bodytype/replika/eulr
	name =            "EULR"
	desc =            "This limb is made of bioengineered flesh with a polyethylene shell, designed for general-purpose duties."
	nickname =        "Eule"
	modifier_string = "\improper EULR model"
	icon_base =       'mods/species/replika/icons/eulr/body.dmi'
	default_h_style = /decl/sprite_accessory/hair/replika/eulr

/decl/bodytype/replika/arar
	name =            "ARAR"
	desc =            "This limb is made of bioengineered flesh with a titanium-reinforced polyethylene shell, designed for repair, maintenance, construction, manufacturing, and other industrial tasks."
	nickname =        "Ara"
	modifier_string = "\improper ARAR model"
	icon_base =       'mods/species/replika/icons/arar/body.dmi'
	default_h_style = /decl/sprite_accessory/hair/replika/arar
	inherent_verbs =  list(/mob/living/proc/ventcrawl)

/decl/bodytype/replika/lstr
	name =            "LSTR"
	desc =            "This limb is made of bioengineered flesh with a carbon fiber-reinforced polyethylene shell, designed to work as a combat engineer or ship technician."
	nickname =        "Elster"
	modifier_string = "\improper LSTR model"
	icon_base =       'mods/species/replika/icons/lstr/body.dmi'
	default_h_style = /decl/sprite_accessory/hair/replika/lstr

/decl/bodytype/replika/star
	name =            "STAR"
	desc =            "This limb is made of bioengineered flesh with a polyethylene shell, designed for general-purpose duties."
	nickname =        "Starling"
	modifier_string = "\improper STAR model"
	icon_base =       'mods/species/replika/icons/star/body.dmi'
	default_h_style = /decl/sprite_accessory/hair/replika/star
	eye_offset =      2

/decl/bodytype/replika/star/Initialize()
	. = ..()
	equip_adjust = list(
		BP_L_HAND =           list("[NORTH]" = list("x" = 0, "y" = 2), "[EAST]" = list("x" = 0, "y" = 2), "[SOUTH]" = list("x" = 0, "y" = 2), "[WEST]" = list("x" = 0, "y" = 2)),
		BP_R_HAND =           list("[NORTH]" = list("x" = 0, "y" = 2), "[EAST]" = list("x" = 0, "y" = 2), "[SOUTH]" = list("x" = 0, "y" = 2), "[WEST]" = list("x" = 0, "y" = 2)),
		slot_head_str =       list("[NORTH]" = list("x" = 0, "y" = 2), "[EAST]" = list("x" = 0, "y" = 2), "[SOUTH]" = list("x" = 0, "y" = 2), "[WEST]" = list("x" = 0, "y" = 2)),
		slot_wear_mask_str =  list("[NORTH]" = list("x" = 0, "y" = 2), "[EAST]" = list("x" = 0, "y" = 2), "[SOUTH]" = list("x" = 0, "y" = 2), "[WEST]" = list("x" = 0, "y" = 2)),
		slot_w_uniform_str =  list("[NORTH]" = list("x" = 0, "y" = 2), "[EAST]" = list("x" = 0, "y" = 2), "[SOUTH]" = list("x" = 0, "y" = 2), "[WEST]" = list("x" = 0, "y" = 2)),
		slot_wear_suit_str =  list("[NORTH]" = list("x" = 0, "y" = 2), "[EAST]" = list("x" = 0, "y" = 2), "[SOUTH]" = list("x" = 0, "y" = 2), "[WEST]" = list("x" = 0, "y" = 2)),
		slot_back_str =       list("[NORTH]" = list("x" = 0, "y" = 2), "[EAST]" = list("x" = 0, "y" = 2), "[SOUTH]" = list("x" = 0, "y" = 2), "[WEST]" = list("x" = 0, "y" = 2)),
		slot_belt_str =       list("[NORTH]" = list("x" = 0, "y" = 2), "[EAST]" = list("x" = 0, "y" = 2), "[SOUTH]" = list("x" = 0, "y" = 2), "[WEST]" = list("x" = 0, "y" = 2)),
		slot_underpants_str = list("[NORTH]" = list("x" = 0, "y" = 2), "[EAST]" = list("x" = 0, "y" = 2), "[SOUTH]" = list("x" = 0, "y" = 2), "[WEST]" = list("x" = 0, "y" = 2)),
	)