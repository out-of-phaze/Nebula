/obj/item/chems/food/butchery/meat/fish
	name                           = "fillet"
	desc                           = "A fillet of fish."
	icon_state                     = "fishfillet"
	filling_color                  = "#ffdefe"
	center_of_mass                 = @'{"x":17,"y":13}'
	bitesize                       = 6
	nutriment_amt                  = 6
	nutriment_type                 = /decl/material/solid/organic/meat/fish
	material                       = /decl/material/solid/organic/meat/fish
	drying_wetness                 = 60
	dried_type                     = /obj/item/chems/food/jerky/fish
	backyard_grilling_product      = /obj/item/chems/food/butchery/meat/fish/grilled
	backyard_grilling_announcement = "steams gently."
	slice_path                     = /obj/item/chems/food/sashimi
	slice_num                      = 3
	var/fish_type                  = "fish"

/obj/item/chems/food/butchery/meat/fish/get_meat_icons()
	var/static/list/meat_icons = list(
		'icons/obj/items/butchery/fish.dmi'
	)
	return meat_icons

/obj/item/chems/food/butchery/meat/fish/Initialize(ml, material_key, mob/living/donor)
	if(donor)
		fish_type = donor.name
	. = ..()

/obj/item/chems/food/butchery/meat/fish/handle_utensil_cutting(obj/item/tool, mob/user)
	. = ..()
	if(islist(.) && !prob(user.skill_fail_chance(SKILL_COOKING, 100, SKILL_PROF)))
		for(var/atom/food in .)
			food.remove_from_reagents(/decl/material/liquid/carpotoxin, REAGENT_VOLUME(reagents, /decl/material/liquid/carpotoxin))

/obj/item/chems/food/butchery/meat/fish/set_name_from(mob/living/donor)
	SetName("[fish_type] [initial(name)]")

/obj/item/chems/food/butchery/meat/fish/grilled
	desc                           = "A lightly grilled fish fillet."
	icon_state                     = "grilledfish"
	nutriment_amt                  = 8
	bitesize                       = 2
	nutriment_desc                 = list("flaky grilled fish" = 5)
	fish_type                      = "grilled fish"
	drying_wetness                 = 0
	dried_type                     = null
	backyard_grilling_product      = null
	backyard_grilling_announcement = null
	slice_path                     = null
	slice_num                      = null

/obj/item/chems/food/butchery/meat/fish/poison
	fish_type = "space carp"

/obj/item/chems/food/butchery/meat/fish/poison/populate_reagents()
	. = ..()
	add_to_reagents(/decl/material/liquid/carpotoxin, 6)

/obj/item/chems/food/butchery/meat/fish/shark
	fish_type = "shark"

/obj/item/chems/food/butchery/meat/fish/carp
	fish_type = "carp"

/obj/item/chems/food/butchery/meat/fish/octopus
	fish_type = "tako"

/obj/item/chems/food/butchery/meat/fish/mollusc
	name           = "meat"
	desc           = "Some slimy meat from clams or molluscs."
	fish_type      = "mollusc"
	nutriment_type = /decl/material/liquid/nutriment/slime_meat

/obj/item/chems/food/butchery/meat/fish/mollusc/clam
	fish_type = "clam"

/obj/item/chems/food/butchery/meat/fish/mollusc/barnacle
	fish_type = "barnacle"
