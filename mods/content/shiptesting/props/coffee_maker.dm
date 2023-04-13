/obj/machinery/chemical_dispenser/ship_coffee
	name = "old coffee maker"
	desc = "This coffee maker looks older than your ship; it's probably older than you, too. \
	Battered and beaten, it still proudly serves coffee to your crew despite its long tour of duty and many changes of ownership."
	icon = 'mods/content/shiptesting/icons/props/coffee.dmi'
	icon_state = "coffee_maker"
	ui_title = "CoffeeMate"
	accept_drinking = TRUE
	core_skill = SKILL_COOKING
	can_contaminate = FALSE //See above.
	base_type = /obj/machinery/chemical_dispenser/bar_coffee
	beaker_offset = -2
	beaker_positions = list(7)
	var/coffeemaker_min_age = 50
	var/coffeemaker_max_age = 70

/obj/machinery/chemical_dispenser/ship_coffee/Initialize()
	. = ..()
	var/coffeemaker_age = global.using_map.game_year - rand(coffeemaker_min_age, coffeemaker_max_age)
	ui_title = "CoffeeMate [coffeemaker_age]"

/obj/machinery/chemical_dispenser/ship_coffee/full
	spawn_cartridges = list(
		/obj/item/chems/chem_disp_cartridge/medium/coffee
	)
	buildable = FALSE

/obj/item/chems/chem_disp_cartridge/medium/coffee/populate_reagents()
	reagents.add_reagent(/decl/material/liquid/drink/coffee, 120) // four full cups!