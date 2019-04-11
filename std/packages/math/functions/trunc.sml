# trunc equals the integer part of $x
function math::trunc {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
