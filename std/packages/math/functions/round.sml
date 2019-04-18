// Implementation is provided by the implementing engine

# round equals the nearest integer, rounding half away from zero
function math::round ($x @N) -> @N

constraints {
	require @N numeric
}
