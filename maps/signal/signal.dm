#if !defined(USING_MAP_DATUM)

	#include "..\..\mods\content\mundane.dm"
	#include "..\..\mods\content\corporate\_corporate.dme"
	#include "..\..\mods\content\government\_government.dme"
	#include "..\..\mods\content\psionics\_psionics.dme"
	#include "..\..\mods\content\modern_earth\_modern_earth.dme"
	#include "..\..\mods\species\neoavians\_neoavians.dme"
	#include "..\..\mods\signal\_signal.dme"

	#include "signal_areas.dm"

	#include "signal_jobs.dm"
	#include "signal_jobs_admin.dm"
	#include "signal_jobs_engineering.dm"
	#include "signal_jobs_medical.dm"
	#include "signal_jobs_police.dm"
	#include "signal_jobs_science.dm"
	#include "signal_jobs_service.dm"

	#include "signal_public_service.dm"
	#include "signal_transit.dm"
	#include "signal_outfits.dm"
	#include "signal_unit_testing.dm"

	#include "signal-1.dmm"
	#include "signal-2.dmm"
	#include "signal-3.dmm"
	#include "signal-4.dmm"
	#include "signal-5.dmm"

	#define USING_MAP_DATUM /datum/map/signal

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Signal

#endif
