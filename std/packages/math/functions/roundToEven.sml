# roundToEven equals the nearest integer, rounding ties to even
function math::round {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
