// Implementation is provided by the implementing engine

# dim equals the maximum of $x - $y or 0
function math::dim (
	$x @N,
	$y @N,
) -> @N

constraints {
	require @N numeric
}
