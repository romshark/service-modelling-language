# tanh equals the hyperbolic tangent of $x
function math::tanh

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
