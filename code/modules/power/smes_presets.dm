/obj/machinery/power/smes/buildable/preset/
	var/_fully_charged = FALSE
	var/_input_maxed = FALSE
	var/_input_on = FALSE
	var/_output_maxed = FALSE
	var/_output_on = FALSE

/obj/machinery/power/smes/buildable/preset/Initialize()
	. = ..()
	if(_input_maxed)
		input_level = input_level_max
	if(_output_maxed)
		output_level = output_level_max
	input_attempt = _input_on
	output_attempt = _output_on
	if(_fully_charged)
		charge = capacity

// Pre-installed and pre-charged SMES hidden from the station, for use in submaps.
/obj/machinery/power/smes/buildable/preset/hidden
	_fully_charged = TRUE
	_input_on = TRUE
	_input_maxed = TRUE
	_output_maxed = TRUE
	RCon = FALSE