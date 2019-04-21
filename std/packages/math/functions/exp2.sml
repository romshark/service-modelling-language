// Implementation is provided by the implementing engine

# exp2 equals 2 ** $x, the base-2 exponential of $x
function math::exp2 ($x @N) -> @N

constraints {
	require @N numeric
}
