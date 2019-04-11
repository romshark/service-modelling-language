# cosh equals the hyperbolic cosine of $x
function math::cosh {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
