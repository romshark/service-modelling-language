# tan equals the tangent of the radian argument $x
function math::tan

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
