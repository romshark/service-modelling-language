# ceil equals the smallest integer greater than or equal to $x
function math::ceil {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
