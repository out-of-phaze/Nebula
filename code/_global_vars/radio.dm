// These globals are the worst


/*
Frequency range: 1200 to 1600
Radiochat range: 1441 to 1489 (most devices refuse to be tune to other frequency, even during mapmaking)

Radio:
1459 - standard radio chat
1351 - Science
1353 - Command
1355 - Medical
1357 - Engineering
1359 - Security
1341 - deathsquad
1443 - Confession Intercom
1347 - Cargo techs
1349 - Service people

Devices:
1451 - tracking implant
1457 - RSD default

On the map:
1311 for prison shuttle console (in fact, it is not used)
1435 for status displays
1437 for atmospherics/fire alerts
1438 for engine components
1439 for air pumps, air scrubbers, atmo control
1441 for atmospherics - supply tanks
1443 for atmospherics - distribution loop/mixed air tank
1445 for bot nav beacons
1447 for mulebot, secbot and ed209 control
1449 for airlock controls, magnets
1451 for toxin lab access
1453 for engineering access
1455 for AI access
*/

var/global/const/RADIO_LOW_FREQ	= 1200
var/global/const/PUBLIC_LOW_FREQ	= 1441
var/global/const/PUBLIC_HIGH_FREQ	= 1489
var/global/const/RADIO_HIGH_FREQ	= 1600

var/global/const/BOT_FREQ	= 1447
var/global/const/COMM_FREQ = 1353
var/global/const/ERT_FREQ	= 1345
var/global/const/AI_FREQ	= 1343
var/global/const/DTH_FREQ	= 1341
var/global/const/SYND_FREQ = 1213
var/global/const/RAID_FREQ	= 1277
var/global/const/ENT_FREQ	= 1461

// department channels
var/global/const/PUB_FREQ = 1459
var/global/const/SEC_FREQ = 1359
var/global/const/ENG_FREQ = 1357
var/global/const/MED_FREQ = 1355
var/global/const/SCI_FREQ = 1351
var/global/const/SRV_FREQ = 1349
var/global/const/SUP_FREQ = 1347
var/global/const/EXP_FREQ = 1361

// internal department channels
var/global/const/MED_I_FREQ = 1485
var/global/const/SEC_I_FREQ = 1475

// Device signal frequencies
var/global/const/ATMOS_ENGINE_FREQ = 1438 // Used by atmos monitoring in the engine.
var/global/const/PUMP_FREQ         = 1439 // Used by air alarms and their progeny.
var/global/const/FUEL_FREQ         = 1447 // Used by fuel atmos stuff, and currently default for digital valves
var/global/const/ATMOS_TANK_FREQ   = 1441 // Used for gas tank sensors and monitoring.
var/global/const/ATMOS_DIST_FREQ   = 1443 // Alternative atmos frequency.
var/global/const/BUTTON_FREQ       = 1301 // Used by generic buttons controlling stuff
var/global/const/BLAST_DOORS_FREQ  = 1303 // Used by blast doors, buttons controlling them, and mass drivers.
var/global/const/AIRLOCK_FREQ      = 1305 // Used by airlocks and buttons controlling them.
var/global/const/SHUTTLE_AIR_FREQ  = 1331 // Used by shuttles and shuttle-related atmos systems.
var/global/const/EXTERNAL_AIR_FREQ = 1381 // Used by some external airlocks.

var/global/list/radiochannels = list(
	"Common"		= PUB_FREQ,
	"Science"		= SCI_FREQ,
	"Command"		= COMM_FREQ,
	"Medical"		= MED_FREQ,
	"Engineering"	= ENG_FREQ,
	"Security" 		= SEC_FREQ,
	"Response Team" = ERT_FREQ,
	"Special Ops" 	= DTH_FREQ,
	"Mercenary" 	= SYND_FREQ,
	"Raider"		= RAID_FREQ,
	"Exploration"	= EXP_FREQ,
	"Supply" 		= SUP_FREQ,
	"Service" 		= SRV_FREQ,
	"AI Private"	= AI_FREQ,
	"Entertainment" = ENT_FREQ,
	"Medical(I)"	= MED_I_FREQ,
	"Security(I)"	= SEC_I_FREQ
)

var/global/list/channel_color_presets = list(
	"Bemoaning Brown" = COMMS_COLOR_SUPPLY,
	"Bitchin' Blue" = COMMS_COLOR_COMMAND,
	"Bold Brass" = COMMS_COLOR_EXPLORER,
	"Gastric Green" = COMMS_COLOR_SERVICE,
	"Global Green" = COMMS_COLOR_COMMON,
	"Menacing Maroon" = COMMS_COLOR_SYNDICATE,
	"Operational Orange" = COMMS_COLOR_ENGINEER,
	"Painful Pink" = COMMS_COLOR_AI,
	"Phenomenal Purple" = COMMS_COLOR_SCIENCE,
	"Pretty Periwinkle" = COMMS_COLOR_CENTCOMM,
	"Raging Red" = COMMS_COLOR_SECURITY,
	"Spectacular Silver" = COMMS_COLOR_ENTERTAIN,
	"Tantalizing Turquoise" = COMMS_COLOR_MEDICAL
)

// central command channels, i.e deathsquid & response teams
var/global/list/CENT_FREQS = list(ERT_FREQ, DTH_FREQ)

// Antag channels, i.e. Syndicate
var/global/list/ANTAG_FREQS = list(SYND_FREQ, RAID_FREQ)

//Department channels, arranged lexically
var/global/list/DEPT_FREQS = list(AI_FREQ, COMM_FREQ, ENG_FREQ, MED_FREQ, SEC_FREQ, SCI_FREQ, SRV_FREQ, SUP_FREQ, EXP_FREQ, ENT_FREQ)

var/global/list/default_medbay_channels = list(
	num2text(PUB_FREQ) = list(),
	num2text(MED_FREQ) = list(access_medical_equip),
	num2text(MED_I_FREQ) = list(access_medical_equip)
)