# floor equals the largest integer less than or equal to $x
function math::floor

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
