# ilogb equals the binary exponent of $x as an integer
function math::ilogb {
	$x @N
}

// Implementation is provided by the implementing engine
value @I

constraints {
	require @N numeric
	require @I integer
}
