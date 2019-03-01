# asinh equals the inverse hyperbolic sine of $x
function math::asinh

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
