# exp2 equals 2 ** $x, the base-2 exponential of $x
function math::exp2

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
