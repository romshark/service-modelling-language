# jn equals the order-n Bessel function of the first kind
function math::jn

parameters {
	$n @I
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @I integer
	require @N numeric
}
