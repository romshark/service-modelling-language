# cos equals the cosine of the radian argument $x
function math::cos {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
