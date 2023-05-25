#if !defined(USING_MAP_DATUM)

	// SHIPTESTING

	#include "../../mods/content/shiptesting/_shiptesting.dme"

	// RUINS
	#include "../random_ruins/exoplanet_ruins/playablecolony/playablecolony.dm"
	#include "../../mods/content/government/ruins/ec_old_crash/ec_old_crash.dm"

	// AWAY MISSIONS

	#include "../../mods/content/corporate/away_sites/lar_maria/lar_maria.dm"
	#include "../../mods/content/government/away_sites/icarus/icarus.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/casino/casino.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/liberia/liberia.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/mining/mining.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/unishi/unishi.dm"
	#include "../away/yacht/yacht.dm"

	// SPECIES

	#include "../../mods/species/bayliens/_bayliens.dme"
	#include "../../mods/species/neoavians/_neoavians.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/species/vox/_vox.dme"

	// UTILITY

	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/scaling_descriptors.dm"

	// CONTENT

	#include "../../mods/content/matchmaking/_matchmaking.dme"
	#include "../../mods/content/modern_earth/_modern_earth.dme"
	#include "../../mods/content/psionics/_psionics.dme"
	#include "../../mods/content/xenobiology/_xenobiology.dme"

	#include "outpost_lobby.dm"
	#include "outpost_areas.dm"
	#include "outpost_exoplanet.dm"

	#include "outpost-surface.dmm"
	#include "outpost-space.dmm"

	#define USING_MAP_DATUM /datum/map/outpost

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Outpost

#endif
