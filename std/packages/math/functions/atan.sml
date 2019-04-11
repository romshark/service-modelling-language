# atan equals the arctangent, in radians, of $x
function math::atan {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
