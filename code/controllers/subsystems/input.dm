SUBSYSTEM_DEF(input)
	name = "Input"
	wait = 1 //SS_TICKER means this runs every tick
	init_order = SS_INIT_INPUT
	flags = SS_TICKER
	priority = SS_PRIORITY_INPUT
	runlevels = RUNLEVELS_DEFAULT | RUNLEVEL_LOBBY

	var/list/macro_set

/datum/controller/subsystem/input/Initialize()
	setup_default_macro_sets()
	refresh_client_macro_sets()
	return ..()

// This is for when macro sets are eventualy datumized
/datum/controller/subsystem/input/proc/setup_default_macro_sets()
	macro_set = list(
	"Any" = "\"keyDown \[\[*\]\]\"",
	"Any+UP" = "\"keyUp \[\[*\]\]\"",
	"W" = "\"keyDown W\"",
	"W+UP" = "\"keyUp W\"",
	"A" = "\"keyDown A\"",
	"A+UP" = "\"keyUp A\"",
	"S" = "\"keyDown S\"",
	"S+UP" = "\"keyUp S\"",
	"D" = "\"keyDown D\"",
	"D+UP" = "\"keyUp D\"",
	"Back" = "\".winset \\\"outputwindow.input.text=\\\"\\\"\\\"\""
	)

// Badmins just wanna have fun ♪
/datum/controller/subsystem/input/proc/refresh_client_macro_sets()
	for(var/client/C in global.clients)
		C.set_macros()

/datum/controller/subsystem/input/fire()
	for(var/client/C in global.clients)
		C.keyLoop()
