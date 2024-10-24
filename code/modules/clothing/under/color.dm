// items not part of the colour changing system

/obj/item/clothing/under/psyche
	name = "psychedelic jumpsuit"
	desc = "Groovy!"
	icon = 'icons/clothing/under/jumpsuits/jumpsuit_psychadelic.dmi'

/obj/item/clothing/under/color/orange
	name = "orange jumpsuit"
	desc = "It's standardised prisoner-wear. Its suit sensor controls are permanently set to the \"Fully On\" position."
	icon = 'icons/clothing/under/jumpsuits/jumpsuit_prisoner.dmi'

/obj/item/clothing/under/color/orange/Initialize()
	. = ..()
	var/obj/item/clothing/sensor/vitals/sensor = new(src)
	sensor.set_sensors_locked(TRUE)
	sensor.set_sensor_mode(VITALS_SENSOR_TRACKING)
	attach_accessory(null, sensor)

/obj/item/clothing/under/color/blackjumpshorts
	name = "black jumpsuit shorts"
	desc = "The latest in space fashion, in a ladies' cut with shorts."
	icon = 'icons/clothing/under/jumpsuits/jumpsuit_shorts.dmi'

/obj/item/clothing/under/color
	name = "jumpsuit"
	desc = "The latest in space fashion."
	icon = 'icons/clothing/under/jumpsuits/jumpsuit.dmi'

/obj/item/clothing/under/color/white
	name = "white jumpsuit"
	color = "#ffffff"

/obj/item/clothing/under/color/black
	name = "black jumpsuit"
	color = "#3d3d3d"

/obj/item/clothing/under/color/grey
	name = "grey jumpsuit"
	color = "#c4c4c4"

/obj/item/clothing/under/color/blue
	name = "blue jumpsuit"
	color = "#0066ff"

/obj/item/clothing/under/color/lightblue
	name = "light blue jumpsuit"
	color = COLOR_LIGHT_CYAN

/obj/item/clothing/under/color/pink
	name = "pink jumpsuit"
	color = "#df20a6"

/obj/item/clothing/under/color/red
	name = "red jumpsuit"
	color = "#ee1511"

/obj/item/clothing/under/color/green
	name = "green jumpsuit"
	color = "#42a345"

/obj/item/clothing/under/color/yellow
	name = "yellow jumpsuit"
	color = "#ffee00"

/obj/item/clothing/under/color/lightpurple
	name = "light purple jumpsuit"
	color = "#c600fc"

/obj/item/clothing/under/color/brown
	name = "brown jumpsuit"
	color = "#c08720"
