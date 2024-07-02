/decl/bodytype/replika
	abstract_type =          /decl/bodytype/replika
	name =                   "replika"
	bodytype_category =      BODYTYPE_HUMANOID
	limb_blend =             ICON_MULTIPLY
	modular_limb_tier =      MODULAR_BODYPART_CYBERNETIC
	body_flags =             0
	modifier_string =        "biosynthetic"
	material =               /decl/material/solid/fiberglass // todo: polyethylene
	base_eye_color =         COLOR_COMMAND_BLUE
	appearance_descriptors = null
	age_descriptor =         /datum/appearance_descriptor/age/replika

	heat_discomfort_strings = list(
		"You are dangerously close to overheating!"
	)
	matter = list(
		/decl/material/solid/organic/meat = MATTER_AMOUNT_SECONDARY // todo: make bioengineered meat toxic to non-replika?
	)
	override_limb_types = list(BP_HEAD = /obj/item/organ/external/head/replika)
	has_organ = list(
		BP_BRAIN =   /obj/item/organ/internal/brain/robotic/replika,
		BP_EYES =    /obj/item/organ/internal/eyes/robot/replika,
		BP_CELL =    /obj/item/organ/internal/cell,
		BP_HEART =   /obj/item/organ/internal/heart/replika,
		BP_LUNGS =   /obj/item/organ/internal/lungs/replika,
		BP_STOMACH = /obj/item/organ/internal/stomach/replika,
	)
	vital_organs = list(
		BP_BRAIN,
		BP_CELL
	)
	traits = list(
		/decl/trait/biosynthetic_healing = REPLIKA_LATE_GEN
	)
	var/nickname

/decl/bodytype/replika/apply_bodytype_organ_modifications(obj/item/organ/org)
	if(istype(org, /obj/item/organ/external))
		var/obj/item/organ/external/external_organ = org
		external_organ.owner?.refresh_modular_limb_verbs()

/decl/bodytype/replika/on_gain(mob/living/human/organism)
	. = ..()
	for(var/trait in traits)
		organism.set_trait(trait, traits[trait])
	organism.reset_hair()

/decl/bodytype/replika/on_lose(mob/living/human/organism)
	. = ..()
	for(var/trait in traits)
		organism.RemoveExtrinsicTrait(trait)

/decl/bodytype/replika/eulr
	name =            "EULR"
	desc =            "This limb is made of bioengineered flesh with a polyethylene shell, designed for general-purpose duties."
	nickname =        "Eule"
	modifier_string = "\improper EULR model"
	icon_base =       'mods/species/replika/icons/eulr/body.dmi'
	default_sprite_accessories = list(
		SAC_HAIR = list(
			/decl/sprite_accessory/hair/replika/eulr = "#000000"
		)
	)

/decl/bodytype/replika/arar
	name =            "ARAR"
	desc =            "This limb is made of bioengineered flesh with a titanium-reinforced polyethylene shell, designed for repair, maintenance, construction, manufacturing, and other industrial tasks."
	nickname =        "Ara"
	modifier_string = "\improper ARAR model"
	icon_base =       'mods/species/replika/icons/arar/body.dmi'
	default_sprite_accessories = list(
		SAC_HAIR = list(
			/decl/sprite_accessory/hair/replika/arar = "#000000"
		)
	)
	inherent_verbs =  list(/mob/living/proc/ventcrawl)
	traits =          list(/decl/trait/biosynthetic_healing = REPLIKA_EARLY_GEN)

/decl/bodytype/replika/lstr
	name =            "LSTR"
	desc =            "This limb is made of bioengineered flesh with a carbon fiber-reinforced polyethylene shell, designed to work as a combat engineer or ship technician."
	nickname =        "Elster"
	modifier_string = "\improper LSTR model"
	icon_base =       'mods/species/replika/icons/lstr/body.dmi'
	default_sprite_accessories = list(
		SAC_HAIR = list(
			/decl/sprite_accessory/hair/replika/lstr = "#000000"
		)
	)

/decl/bodytype/replika/star
	name =            "STAR"
	desc =            "This limb is made of bioengineered flesh with a polyethylene shell, designed for general-purpose duties."
	nickname =        "Starling"
	modifier_string = "\improper STAR model"
	icon_base =       'mods/species/replika/icons/star/body.dmi'
	default_sprite_accessories = list(
		SAC_HAIR = list(
			/decl/sprite_accessory/hair/replika/star = "#000000"
		)
	)
	eye_offset =      2

/decl/bodytype/replika/star/Initialize()
	. = ..()
	equip_adjust = list(
		BP_L_HAND =           list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list(0, 2), "[WEST]" = list(0, 2)),
		BP_R_HAND =           list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list(0, 2), "[WEST]" = list(0, 2)),
		slot_head_str =       list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list(0, 2), "[WEST]" = list(0, 2)),
		slot_wear_mask_str =  list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list(0, 2), "[WEST]" = list(0, 2)),
		slot_w_uniform_str =  list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list(0, 2), "[WEST]" = list(0, 2)),
		slot_wear_suit_str =  list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list(0, 2), "[WEST]" = list(0, 2)),
		slot_back_str =       list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list(0, 2), "[WEST]" = list(0, 2)),
		slot_belt_str =       list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list(0, 2), "[WEST]" = list(0, 2)),
		slot_underpants_str = list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list(0, 2), "[WEST]" = list(0, 2)),
	)

/decl/bodytype/replika/klbr
	name =            "KLBR"
	desc =            "This limb is made of bioengineered flesh with a polyethylene shell, designed for general-purpose duties."
	nickname =        "Kolibri"
	modifier_string = "\improper KLBR model"
	icon_base =       'mods/species/replika/icons/klbr/body.dmi'
	default_sprite_accessories = list(
		SAC_HAIR = list(
			/decl/sprite_accessory/hair/replika/klbr = "#000000"
		)
	)
	eye_offset =     -1

// TODO: Give Kolibris (and Falkes) an organ for their bioresonance
/decl/bodytype/replika/klbr/on_gain(mob/living/human/organism)
	. = ..()
	organism.set_psi_rank(PSI_COERCION, 2)

/decl/bodytype/replika/klbr/on_lose(mob/living/human/organism)
	. = ..()
	var/datum/ability_handler/psionics/psi = organism.get_ability_handler(/datum/ability_handler/psionics)
	qdel(psi)

/decl/bodytype/replika/klbr/Initialize()
	. = ..()
	equip_adjust = list(
		BP_L_HAND =           list("[NORTH]" = list(0, -1), "[EAST]" = list(0, -1), "[SOUTH]" = list(0, -1), "[WEST]" = list(0, -1)),
		BP_R_HAND =           list("[NORTH]" = list(0, -1), "[EAST]" = list(0, -1), "[SOUTH]" = list(0, -1), "[WEST]" = list(0, -1)),
		slot_head_str =       list("[NORTH]" = list(0, -1), "[EAST]" = list(0, -1), "[SOUTH]" = list(0, -1), "[WEST]" = list(0, -1)),
		slot_wear_mask_str =  list("[NORTH]" = list(0, -1), "[EAST]" = list(0, -1), "[SOUTH]" = list(0, -1), "[WEST]" = list(0, -1)),
		slot_w_uniform_str =  list("[NORTH]" = list(0, -1), "[EAST]" = list(0, -1), "[SOUTH]" = list(0, -1), "[WEST]" = list(0, -1)),
		slot_wear_suit_str =  list("[NORTH]" = list(0, -1), "[EAST]" = list(0, -1), "[SOUTH]" = list(0, -1), "[WEST]" = list(0, -1)),
		slot_back_str =       list("[NORTH]" = list(0, -1), "[EAST]" = list(0, -1), "[SOUTH]" = list(0, -1), "[WEST]" = list(0, -1)),
		slot_belt_str =       list("[NORTH]" = list(0, -1), "[EAST]" = list(0, -1), "[SOUTH]" = list(0, -1), "[WEST]" = list(0, -1)),
		slot_underpants_str = list("[NORTH]" = list(0, -1), "[EAST]" = list(0, -1), "[SOUTH]" = list(0, -1), "[WEST]" = list(0, -1)),
	)