#if !defined(USING_MAP_DATUM)

	#include "../../mods/content/matchmaking/_matchmaking.dme"
	#include "../../mods/content/dungeon_loot/_dungeon_loot.dme"
	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/scaling_descriptors.dm"
	#include "../../mods/species/drakes/_drakes.dme" // include before _fantasy.dme so overrides work
	#include "../../mods/content/item_sharpening/_item_sharpening.dme"
	#include "../../mods/content/fantasy/_fantasy.dme"
	#include "../../mods/content/blacksmithy/_blacksmithy.dme"

	#include "areas/_areas.dm"
	#include "areas/grassland.dm"
	#include "areas/swamp.dm"
	#include "areas/woods.dm"

	#include "jobs/_jobs.dm"
	#include "jobs/visitors.dm"
	#include "jobs/homestead.dm"

	#include "levels/_levels.dm"
	#include "levels/random_map.dm"
	#include "levels/strata.dm"

	#include "outfits/_outfits.dm"
	#include "outfits/visitors.dm"
	#include "outfits/homesteaders.dm"

	#include "homestead_currency.dm"
	#include "homestead_events.dm"
	#include "homestead_map.dm"
	#include "homestead_skills.dm"
	#include "homestead_testing.dm"
	#include "homestead_turfs.dm"

	// Caverns are below grassland and must be compiled in that order for multiz.
	#include "homestead-caverns.dmm"
	#include "homestead-grassland.dmm"
	// Other levels are lateral and compile order doesn't matter.
	#include "homestead-swamp.dmm"
	#include "homestead-woods.dmm"

	#define USING_MAP_DATUM /datum/map/homestead

#elif !defined(MAP_OVERRIDE)
	#warn A map has already been included, ignoring Homestead
#endif
