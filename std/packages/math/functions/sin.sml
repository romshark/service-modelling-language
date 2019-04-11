# sin equals the sine of the radian argument $x
function math::sin {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
