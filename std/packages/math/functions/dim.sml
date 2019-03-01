# dim equals the maximum of $x - $y or 0
function math::dim

parameters {
	$x @N
	$y @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
