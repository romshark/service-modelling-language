# round equals the nearest integer, rounding half away from zero
function math::round {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
