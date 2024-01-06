#if !defined(USING_MAP_DATUM)

	#include "../../mods/content/mundane.dm"
	#include "../../mods/content/bigpharma/_bigpharma.dme"
	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/content/government/_government.dme"
	#include "../../mods/content/modern_earth/_modern_earth.dme"
	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/psionics/_psionics.dme"
	#include "../../mods/content/scaling_descriptors.dm"
	#include "../../mods/content/xenobiology/_xenobiology.dme"
	#include "../../mods/content/matchmaking/_matchmaking.dme"

	#include "../../mods/mobs/dionaea/_dionaea.dme"
	#include "../../mods/mobs/borers/_borers.dme"

	#include "../../mods/species/ascent/_ascent.dme"
	#include "../../mods/species/serpentid/_serpentid.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/species/neoavians/_neoavians.dme"
	#include "../../mods/species/bayliens/_bayliens.dme"
	#include "../../mods/species/vox/_vox.dme"

	#include "datum/turbolifts.dm"

	#include "atoms/cameras.dm"
	#include "atoms/flora.dm"
	#include "atoms/mobs.dm"
	#include "atoms/machinery.dm"
	#include "atoms/telecoms.dm"
	#include "atoms/guns.dm"

	#include "jobs/jobs.dm"
	#include "jobs/departments.dm"

	#include "crux_areas.dm"
	#include "crux_cryo.dm"
	#include "crux_overmap.dm"
	#include "crux_testing.dm"

	#include "crux-station-0.dmm"
	#include "crux-station-1.dmm"
	#include "crux-station-2.dmm"

	#define USING_MAP_DATUM /datum/map/crux

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Southern Cross

#endif
