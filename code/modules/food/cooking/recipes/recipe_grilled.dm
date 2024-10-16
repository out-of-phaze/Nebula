/decl/recipe/grilled
	abstract_type = /decl/recipe/grilled
	//cooking_heat_type = COOKING_HEAT_DIRECT

/decl/recipe/grilled/plainsteak
	items = list(/obj/item/chems/food/butchery/meat)
	result = /obj/item/chems/food/plainsteak

/decl/recipe/grilled/meatsteak
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(/obj/item/chems/food/cutlet)
	result = /obj/item/chems/food/meatsteak

/decl/recipe/grilled/loadedsteak
	reagents = list(/decl/material/liquid/nutriment/garlicsauce = 5)
	fruit = list("onion" = 1, "mushroom" = 1)
	items = list(/obj/item/chems/food/cutlet)
	result = /obj/item/chems/food/loadedsteak

/decl/recipe/grilled/syntisteak
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(/obj/item/chems/food/butchery/meat/syntiflesh)
	result = /obj/item/chems/food/meatsteak/synthetic

/decl/recipe/grilled/toastedsandwich
	items = list(
		/obj/item/chems/food/sandwich
	)
	result = /obj/item/chems/food/toastedsandwich

/decl/recipe/grilled/grilledcheese
	items = list(
		/obj/item/chems/food/slice/bread = 2,
		/obj/item/chems/food/cheesewedge,
	)
	result = /obj/item/chems/food/grilledcheese

/decl/recipe/grilled/fishfingers
	reagents = list(/decl/material/liquid/nutriment/flour = 10)
	items = list(
		/obj/item/chems/food/egg,
		/obj/item/chems/food/butchery/meat/fish
	)
	reagent_mix = REAGENT_REPLACE // no raw egg/fish
	result = /obj/item/chems/food/fishfingers

/decl/recipe/grilled/meatball
	items = list(
		/obj/item/chems/food/meatball/raw
	)
	result = /obj/item/chems/food/meatball

/decl/recipe/grilled/cutlet
	items = list(
		/obj/item/chems/food/cutlet/raw
	)
	result = /obj/item/chems/food/cutlet

/decl/recipe/grilled/meatkabob
	items = list(
		/obj/item/stack/material/rods,
		/obj/item/chems/food/cutlet = 2
	)
	result = /obj/item/chems/food/meatkabob

/decl/recipe/grilled/tofukabob
	items = list(
		/obj/item/stack/material/rods,
		/obj/item/chems/food/tofu = 2,
	)
	result = /obj/item/chems/food/tofukabob
