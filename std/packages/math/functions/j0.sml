# j0 equals the order-zero Bessel function of the first kind
function math::j0 {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
