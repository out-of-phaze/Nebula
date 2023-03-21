/mob/observer/ghost/Login()
	..()
	if (ghost_image)
		// TEMPORARY OD TWEAK
		OD_set_appearance(ghost_image, src)
		// ghost_image.appearance = src
		ghost_image.appearance_flags = RESET_ALPHA
	SSghost_images.queue_image_update(src)
