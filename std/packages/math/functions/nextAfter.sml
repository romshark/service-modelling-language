# nextAfter equals the next representable Float64 value after $x towards $y
function math::nextAfter

parameters {
	$x @N
	$y @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
