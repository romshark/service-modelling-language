# atanh equals the inverse hyperbolic tangent of $x
function math::atanh

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
