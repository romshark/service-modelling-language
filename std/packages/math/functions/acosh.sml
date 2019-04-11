# acosh equals the inverse hyperbolic cosine of $x
function math::acosh {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
