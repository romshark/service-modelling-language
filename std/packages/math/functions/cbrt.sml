# cbrt equals the cube root of $x
function math::cbrt {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
