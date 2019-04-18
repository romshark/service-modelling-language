// Implementation is provided by the implementing engine

# ilogb equals the binary exponent of $x as an integer
function math::ilogb ($x @N) -> @I

constraints {
	require @N numeric
	require @I integer
}
