# sqrt equals the square root of $x
function math::sqrt

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
