# gamma equals the Gamma function of $x
function math::gamma

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
