#define SHIP_NAMES_FILE "mods/content/shiptesting/ship_names.json"

/datum/map_template/ship
	// Prefix/suffix system copied from ruins because for some reason it's not on /datum/map_template.
	var/prefix = "mods/content/shiptesting/ships/"
	var/list/suffixes
	template_parent_type = /datum/map_template/ship
	template_categories = list(MAP_TEMPLATE_CATEGORY_SHIP)
	template_flags = TEMPLATE_FLAG_ALLOW_DUPLICATES
	modify_tag_vars = TRUE

var/global/list/ship_names_by_class = list()

/hook/startup/proc/load_ship_names()
	// Load our banned map list, if we have one.
	if(fexists(SHIP_NAMES_FILE))
		global.ship_names_by_class = cached_json_decode(safe_file2text(SHIP_NAMES_FILE))
	return TRUE

/datum/map_template/ship/New()
	for (var/suffix in suffixes)
		LAZYADD(mappaths, "[prefix][suffix]")
	..()

/obj/effect/overmap/visitable/ship/landable/spawnable
	var/list/name_prefixes = list("SEV", "SIC", "FTUV", "ICV", "HMS")
	var/list/ship_name_classes = list("GENERAL", "SPACE", "NATURAL", "MERCANTILE")

/obj/effect/overmap/visitable/ship/landable/spawnable/Initialize()
	. = ..()
	var/new_name = ""
	if(islist(name_prefixes))
		new_name = pick(name_prefixes)
	else if(istext(name_prefixes))
		new_name = name_prefixes
	new_name += " [pick(global.ship_names_by_class[pick(ship_name_classes)])]"
	SetName("\improper [new_name]") // so that we get "you are landed on by the SEV Icarus" instead of "you are landed on by SEV Icarus"

// We stay synced with our overmap object at all times.
/datum/submap/spawnable_ship/sync_cell(obj/effect/overmap/visitable/cell)
	..()
	events_repository.register(/decl/observ/name_set, cell, src, PROC_REF(update_name))
	events_repository.register(/decl/observ/destroyed, cell, src, PROC_REF(unregister_name))

/datum/submap/spawnable_ship/proc/update_name(atom/namee, old_name, new_name)
	name = new_name

/datum/submap/spawnable_ship/proc/unregister_name(datum/destroyed_instance)
	events_repository.register(/decl/observ/name_set, destroyed_instance, src, PROC_REF(update_name))
	events_repository.register(/decl/observ/destroyed, destroyed_instance, src, PROC_REF(unregister_name))

/obj/abstract/submap_landmark/joinable_submap/spawnable_ship
	abstract_type = /obj/abstract/submap_landmark/joinable_submap/spawnable_ship
	submap_datum_type = /datum/submap/spawnable_ship

/decl/submap_archetype/spawnable_ship
	sort_priority = -1 // these should always be above everything else
	default_to_hidden = FALSE
	abstract_type = /decl/submap_archetype/spawnable_ship

/datum/job/submap/shiptesting
	abstract_type = /datum/job/submap/shiptesting
	suppress_no_roundstart_warning = TRUE