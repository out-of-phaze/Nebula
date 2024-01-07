var/global/const/CAMERA_CHANNEL_COMMAND = "Command"
var/global/const/CAMERA_CHANNEL_ENGINE  = "Engine"
var/global/const/CAMERA_CHANNEL_ENGINEERING_OUTPOST = "Engineering Outpost"
var/global/const/CAMERA_CHANNEL_RESEARCH_OUTPOST = "Research Outpost"
var/global/const/CAMERA_CHANNEL_THUNDERDOME = "Thunderdome"
var/global/const/CAMERA_CHANNEL_CIVILIAN = "Civilian"
var/global/const/CAMERA_CHANNEL_DECK_ONE = "Ground Floor"
var/global/const/CAMERA_CHANNEL_DECK_TWO = "First Floor"
var/global/const/CAMERA_CHANNEL_DECK_THREE = "Second Floor"
var/global/const/CAMERA_CHANNEL_TCOMMS = "Telecommunications"
var/global/const/CAMERA_CHANNEL_OUTPOST = "Main Outpost"
var/global/const/CAMERA_CHANNEL_PRISON = "Prison"
var/global/const/CAMERA_CHANNEL_CARGO = "Cargo Bay"

/obj/machinery/camera/network/command
	preset_channels = list(CAMERA_CHANNEL_COMMAND)
	initial_access = list(access_heads)
/obj/machinery/camera/xray/command
	preset_channels = list(CAMERA_CHANNEL_COMMAND)
	initial_access = list(access_heads)
/obj/machinery/camera/network/engineering_outpost
	preset_channels = list(CAMERA_CHANNEL_ENGINEERING_OUTPOST)
	initial_access = list(access_engine)
/obj/machinery/camera/network/engine
	preset_channels = list(CAMERA_CHANNEL_ENGINE)
	initial_access = list(access_engine)
/obj/machinery/camera/network/research_outpost
	preset_channels = list(CAMERA_CHANNEL_RESEARCH_OUTPOST)
	initial_access = list(access_research)
/obj/machinery/camera/network/thunder
	preset_channels = list(CAMERA_CHANNEL_THUNDERDOME)
/obj/machinery/camera/network/first_deck
	preset_channels = list(CAMERA_CHANNEL_CIVILIAN, CAMERA_CHANNEL_DECK_ONE)
/obj/machinery/camera/network/second_deck
	preset_channels = list(CAMERA_CHANNEL_CIVILIAN, CAMERA_CHANNEL_DECK_TWO)
/obj/machinery/camera/network/third_deck
	preset_channels = list(CAMERA_CHANNEL_CIVILIAN, CAMERA_CHANNEL_DECK_THREE)
/obj/machinery/camera/network/civilian
	preset_channels = list(CAMERA_CHANNEL_CIVILIAN)
/obj/machinery/camera/network/prison
	preset_channels = list(CAMERA_CHANNEL_PRISON)
	initial_access = list(access_security)
/obj/machinery/camera/network/cargo
	preset_channels = list(CAMERA_CHANNEL_CARGO)
	initial_access = list(access_cargo)
/obj/machinery/camera/network/telecom
	preset_channels = list(CAMERA_CHANNEL_TCOMMS)
	initial_access = list(access_tcomsat)
/obj/machinery/camera/network/main_outpost
	preset_channels = list(CAMERA_CHANNEL_CIVILIAN, CAMERA_CHANNEL_OUTPOST)
