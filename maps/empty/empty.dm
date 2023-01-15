#if !defined(USING_MAP_DATUM)

	#include "../../mods/content/shiptesting/_shiptesting.dme"

	#include "empty_lobby.dm"

	#include "empty.dmm"

	#define USING_MAP_DATUM /datum/map/empty

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Empty Space

#endif
