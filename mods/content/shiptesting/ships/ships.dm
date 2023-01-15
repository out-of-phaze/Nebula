/datum/map_template/ship
	// Prefix/suffix system copied from ruins because for some reason it's not on /datum/map_template.
	var/prefix = "mods/content/shiptesting/ships/"
	var/list/suffixes
	template_parent_type = /datum/map_template/ship
	template_categories = list(MAP_TEMPLATE_CATEGORY_SHIP)
	template_flags = TEMPLATE_FLAG_ALLOW_DUPLICATES
	modify_tag_vars = TRUE

/datum/map_template/ship/New()
	for (var/suffix in suffixes)
		LAZYADD(mappaths, "[prefix][suffix]")
	..()