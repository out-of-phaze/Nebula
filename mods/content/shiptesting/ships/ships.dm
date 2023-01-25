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
	var/prefix
	if(islist(name_prefixes))
		prefix = pick(name_prefixes)
	else if(istext(name_prefixes))
		prefix = name_prefixes
	name = "[pick(global.ship_names_by_class[pick(ship_name_classes)])]"
	if(prefix)
		name = "[pick("SEV", "SIC", "FTUV", "ICV", "HMS")] [name]"
	name = "\improper [name]" // so that we get "you are landed on by the SEV Icarus" instead of "you are landed on by SEV Icarus"

/decl/submap_archetype/spawnable_ship
	abstract_type = /decl/submap_archetype/spawnable_ship