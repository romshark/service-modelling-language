# pow equals $x raised to a floating point power $power
function math::pow

parameters {
	$x     @N
	$power @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
