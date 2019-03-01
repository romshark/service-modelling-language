# asin equals the arcsine, in radians, of $x
function math::asin

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
