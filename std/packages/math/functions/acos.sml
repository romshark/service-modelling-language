# acos equals the arccosine, in radians, of $x
function math::acos

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
