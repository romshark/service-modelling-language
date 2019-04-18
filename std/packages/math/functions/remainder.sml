// Implementation is provided by the implementing engine

# remainder equals the IEEE 754 floating-point remainder of $x / $y.
function math::remainder (
	$x @N,
	$y @N,
) -> @N

constraints {
	require @N numeric
}
