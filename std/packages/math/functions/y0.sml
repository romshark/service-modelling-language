# y0 equals the order-zero Bessel function of the second kind
function math::y0 {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
