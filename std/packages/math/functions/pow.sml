// Implementation is provided by the implementing engine

# pow equals $x raised to a floating point power $power
function math::pow (
	$x     @N,
	$power @N,
) -> @N

constraints {
	require @N numeric
}
