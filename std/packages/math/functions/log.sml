# log equals the natural logarithm of $x
function math::log {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
