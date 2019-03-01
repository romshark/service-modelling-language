# logb equals the binary exponent of $x
function math::logb

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
