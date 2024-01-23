/obj/abstract/turbolift_spawner/crux
	icon = 'icons/obj/turbolift_preview_5x5.dmi'
	depth = 2
	lift_size_x = 4
	lift_size_y = 4

/obj/abstract/turbolift_spawner/crux/west
	name = "Sothern Cross turbolift map placeholder - West"
	dir = EAST
	areas_to_use = list(
		/area/turbolift/crux/port_deck_one,
		/area/turbolift/crux/port_deck_two
		)

/obj/abstract/turbolift_spawner/crux/east
	name = "Sothern Cross turbolift map placeholder - East"
	dir = WEST
	areas_to_use = list(
		/area/turbolift/crux/starboard_deck_one,
		/area/turbolift/crux/starboard_deck_two
		)

/obj/abstract/turbolift_spawner/crux/cargo
	name = "Sothern Cross turbolift map placeholder - Cargo"
	dir = WEST
	areas_to_use = list(
		/area/turbolift/crux/cargo_deck_one,
		/area/turbolift/crux/cargo_deck_two
		)

/obj/abstract/turbolift_spawner/crux/center
	name = "Sothern Cross turbolift map placeholder - Center"
	depth = 3
	areas_to_use = list(
		/area/turbolift/crux/center_deck_one,
		/area/turbolift/crux/center_deck_two,
		/area/turbolift/crux/center_deck_three
	)
