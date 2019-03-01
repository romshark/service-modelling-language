# j1 equals the order-one Bessel function of the first kind
function math::j1

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
