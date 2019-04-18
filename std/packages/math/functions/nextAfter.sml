// Implementation is provided by the implementing engine

# nextAfter equals the next representable Float64 value after $x towards $y
function math::nextAfter (
	$x @N,
	$y @N,
) -> @N

constraints {
	require @N numeric
}
