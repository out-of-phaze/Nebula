#define BAD_INIT_QDEL_BEFORE 1
#define BAD_INIT_DIDNT_INIT 2
#define BAD_INIT_SLEPT 4
#define BAD_INIT_NO_HINT 8

SUBSYSTEM_DEF(atoms)
	name = "Atoms"
	init_order = SS_INIT_ATOMS
	flags = SS_NO_FIRE | SS_NEEDS_SHUTDOWN

	var/atom_init_stage = INITIALIZATION_INSSATOMS
	var/old_init_stage

	/// A list of atoms to call LateInitialize on.
	var/list/late_loaders = list()

	var/list/BadInitializeCalls = list()

/datum/controller/subsystem/atoms/Initialize(timeofday)
	atom_init_stage = INITIALIZATION_INNEW_MAPLOAD
	InitializeAtoms()
	return ..()

/datum/controller/subsystem/atoms/proc/InitializeAtoms(list/which_atoms)
	if(atom_init_stage <= INITIALIZATION_INSSATOMS)
		return

	atom_init_stage = INITIALIZATION_INNEW_MAPLOAD
	if(!which_atoms)
		InitializeWorldAtoms()
	else
		InitializeListAtoms(which_atoms)
	atom_init_stage = INITIALIZATION_INNEW_REGULAR

	if(length(late_loaders))
		// due to atom_init_stage this should be safe, as nothing should be added to late_loaders in LateInitialize
		for(var/atom/A as anything in late_loaders)
			A.LateInitialize()
			CHECK_TICK
		report_progress("Late initialized [length(late_loaders)] atom\s")
		late_loaders.Cut()

/datum/controller/subsystem/atoms/proc/InitializeWorldAtoms()
	. = 0 // count of atoms initialized
	var/list/mapload_arg = list(TRUE)
	for(var/atom/A as anything in world)
		if(!(A.atom_flags & ATOM_FLAG_INITIALIZED)) // skip any INITIALIZE_IMMEDIATE atoms
			InitAtom(A, mapload_arg)
			.++
	report_progress("Initialized [.] atom\s in world")

/datum/controller/subsystem/atoms/proc/InitializeListAtoms(list/atoms)
	var/static/list/mapload_arg = list(TRUE)
	if(!length(atoms))
		return // todo: crash? ASSERT(length(atoms) > 0)?

	. = 0
	for(var/atom/A as anything in atoms) // no nulls please
		if(QDELING(A) || (A.atom_flags & ATOM_FLAG_INITIALIZED))
			EMPTY_BLOCK_GUARD // Pass
		else
			InitAtom(A, mapload_arg)
			.++
			CHECK_TICK
	report_progress("Initialized [.] atom\s")

/datum/controller/subsystem/atoms/proc/InitAtom(atom/A, list/arguments)
	var/the_type = A.type
	if(QDELING(A))
		BadInitializeCalls[the_type] |= BAD_INIT_QDEL_BEFORE
		return TRUE

	// This is handled and battle tested by dreamchecker. Limit to UNIT_TEST just in case that ever fails.
	#ifdef UNIT_TEST
	var/start_tick = world.time
	#endif

	var/result = A.Initialize(arglist(arguments))

	#ifdef UNIT_TEST
	if(start_tick != world.time)
		BadInitializeCalls[the_type] |= BAD_INIT_SLEPT
	#endif

	// have we been qdeleted?
	. = FALSE

	switch(result)
		if(INITIALIZE_HINT_NORMAL)
			EMPTY_BLOCK_GUARD // Pass
		if(INITIALIZE_HINT_LATELOAD)
			if(arguments[1]) //mapload
				late_loaders += A
			else
				A.LateInitialize()
		if(INITIALIZE_HINT_QDEL)
			A.atom_flags |= ATOM_FLAG_INITIALIZED // never call EarlyDestroy if we return this hint
			qdel(A)
			. = TRUE
		else
			BadInitializeCalls[the_type] |= BAD_INIT_NO_HINT

	if(!A)	//possible harddel
		. = TRUE
	else if(!(A.atom_flags & ATOM_FLAG_INITIALIZED))
		BadInitializeCalls[the_type] |= BAD_INIT_DIDNT_INIT

	return . || QDELING(A)

/datum/controller/subsystem/atoms/stat_entry(msg)
	..("Bad Initialize Calls:[BadInitializeCalls.len]")

/datum/controller/subsystem/atoms/proc/map_loader_begin()
	old_init_stage = atom_init_stage
	atom_init_stage = INITIALIZATION_INSSATOMS

/datum/controller/subsystem/atoms/proc/map_loader_stop()
	atom_init_stage = old_init_stage

/datum/controller/subsystem/atoms/Recover()
	atom_init_stage = SSatoms.atom_init_stage
	if(atom_init_stage == INITIALIZATION_INNEW_MAPLOAD)
		InitializeAtoms()
	old_init_stage = SSatoms.old_init_stage
	BadInitializeCalls = SSatoms.BadInitializeCalls

/datum/controller/subsystem/atoms/proc/InitLog()
	. = ""
	for(var/path in BadInitializeCalls)
		. += "Path : [path] \n"
		var/fails = BadInitializeCalls[path]
		if(fails & BAD_INIT_DIDNT_INIT)
			. += "- Didn't call atom/Initialize()\n"
		if(fails & BAD_INIT_NO_HINT)
			. += "- Didn't return an Initialize hint\n"
		if(fails & BAD_INIT_QDEL_BEFORE)
			. += "- Qdel'd in New()\n"
		if(fails & BAD_INIT_SLEPT)
			. += "- Slept during Initialize()\n"

/datum/controller/subsystem/atoms/Shutdown()
	var/initlog = InitLog()
	if(initlog)
		text2file(initlog, "[global.log_directory]/initialize.log")
