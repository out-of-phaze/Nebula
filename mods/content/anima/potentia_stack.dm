/obj/item/stack/material/potentia
	name                = "blanks"
	desc                = "A condensed, crystalline form of magical energy, cut into rough, unworked rounds and ready for etching."
	singular_name       = "blank"
	plural_name         = "blanks"
	icon_state          = "anima"
	icon                = 'mods/content/anima/icons/anima_blank.dmi'
	plural_icon_state   = "anima-mult"
	max_icon_state      = "anima-max"
	stack_merge_type    = /obj/item/stack/material/potentia
	crafting_stack_type = /obj/item/stack/material/potentia
	material_alteration = MAT_FLAG_ALTERATION_COLOR | MAT_FLAG_ALTERATION_NAME | MAT_FLAG_ALTERATION_DESC
	max_amount          = 5

/obj/item/stack/material/potentia/mapped/fire
	amount = 1
	material = /decl/material/solid/potentia/fire
	is_spawnable_type = TRUE

/obj/item/stack/material/potentia/mapped/fire/five
	name = "5 fire potentia blanks"
	amount = 5

/decl/stack_recipe/potentia
	abstract_type     = /decl/stack_recipe/potentia
	craft_stack_types = /obj/item/stack/material/potentia
	required_material = /decl/material/solid/potentia

/decl/stack_recipe/potentia/runestone
	result_type       = /obj/item/runestone
