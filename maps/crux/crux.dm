#if !defined(USING_MAP_DATUM)

	#include "../../mods/crux/_crux.dme"

	#include "../../mods/content/mundane.dm"
	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/content/government/_government.dme"
	#include "../../mods/content/modern_earth/_modern_earth.dme"
	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/scaling_descriptors.dm"
	#include "../../mods/content/xenobiology/_xenobiology.dme"
	#include "../../mods/content/matchmaking/_matchmaking.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"

	#include "datum/turbolifts.dm"

	#include "atoms/cameras.dm"
	#include "atoms/flora.dm"
	#include "atoms/mobs.dm"
	#include "atoms/machinery.dm"
	#include "atoms/telecoms.dm"
	#include "atoms/guns.dm"

	#include "areas/_areas.dm"
	#include "areas/bridge.dm"
	#include "areas/engineering.dm"
	#include "areas/eva.dm"
	#include "areas/giftshop.dm"
	#include "areas/habitation.dm"
	#include "areas/hallways.dm"
	#include "areas/hangar.dm"
	#include "areas/hotel.dm"
	#include "areas/maintenance.dm"
	#include "areas/medical.dm"
	#include "areas/network.dm"
	#include "areas/outside.dm"
	#include "areas/science.dm"
	#include "areas/secure.dm"
	#include "areas/shuttles.dm"
	#include "areas/storage.dm"
	#include "areas/supply.dm"
	#include "areas/turbolift.dm"

	#include "jobs/jobs.dm"
	#include "jobs/departments.dm"

	#include "submaps/_submaps.dm"
	#include "submaps/engine/engine_supermatter.dm"

	#include "crux_cryo.dm"
	#include "crux_overmap.dm"
	#include "crux_testing.dm"

	#include "crux-station-0.dmm"
	#include "crux-station-1.dmm"
	#include "crux-station-2.dmm"

	#define USING_MAP_DATUM /datum/map/crux

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Eleostura

#endif
