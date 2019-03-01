# cosh equals the hyperbolic cosine of $x
function math::cosh

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
