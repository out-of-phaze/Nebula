/obj/structure/reagent_dispensers/well
	name                      = "well"
	desc                      = "A deep pit lined with stone bricks, used to store water."
	icon                      = 'icons/obj/structures/well.dmi'
	icon_state                = ICON_STATE_WORLD
	opacity                   = FALSE
	anchored                  = TRUE
	density                   = TRUE
	atom_flags                = ATOM_FLAG_CLIMBABLE | ATOM_FLAG_OPEN_CONTAINER
	matter                    = null
	material                  = /decl/material/solid/stone/granite
	color                     = /decl/material/solid/stone/granite::color
	material_alteration       = MAT_FLAG_ALTERATION_ALL
	wrenchable                = FALSE
	amount_dispensed          = 10
	possible_transfer_amounts = @"[10,25,50,100]"
	volume                    = 10000
	can_toggle_open           = FALSE
	var/auto_refill

/obj/structure/reagent_dispensers/well/populate_reagents()
	. = ..()
	if(auto_refill)
		add_to_reagents(auto_refill, reagents.maximum_volume)

/obj/structure/reagent_dispensers/well/Destroy()
	if(is_processing)
		STOP_PROCESSING(SSobj, src)
	return ..()

/obj/structure/reagent_dispensers/well/on_update_icon()
	. = ..()
	if(reagents?.total_volume)
		add_overlay(overlay_image(icon, "[icon_state]-fluid", reagents.get_color(), (RESET_COLOR | RESET_ALPHA)))

/obj/structure/reagent_dispensers/well/on_reagent_change()
	if(!(. = ..()))
		return
	update_icon()
	if(!is_processing && auto_refill)
		START_PROCESSING(SSobj, src)

/obj/structure/reagent_dispensers/well/attackby(obj/item/W, mob/user)
	. = ..()
	if(!. && user.a_intent == I_HELP && reagents?.total_volume > FLUID_PUDDLE)
		user.visible_message(SPAN_NOTICE("\The [user] dips \the [W] into \the [reagents.get_primary_reagent_name()]."))
		W.fluid_act(reagents)
		return TRUE

/obj/structure/reagent_dispensers/well/mapped
	auto_refill = /decl/material/liquid/water

/obj/structure/reagent_dispensers/well/mapped/Process()
	if(!reagents || (reagents.total_volume >= reagents.maximum_volume) || !auto_refill)
		return PROCESS_KILL
	reagents.add_reagent(auto_refill, rand(5, 10))
	if(reagents.total_volume >= reagents.maximum_volume)
		return PROCESS_KILL

/obj/structure/reagent_dispensers/well/wall_fountain
	name            = "wall fountain"
	desc            = "An intricately-constructed fountain set into a wall."
	icon            = 'icons/obj/structures/wall_fountain.dmi'
	density         = FALSE
	default_pixel_y = 24
	pixel_y         = 24

/obj/structure/reagent_dispensers/well/wall_fountain/mapped
	auto_refill = /decl/material/liquid/water
