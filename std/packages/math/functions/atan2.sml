// Implementation is provided by the implementing engine

# atan2 equals the arc tangent of $y/$x,
# using the signs of the two to determine the quadrant of the return value
function math::atan2 (
	$y @N,
	$x @N,
) -> @N

constraints {
	require @N numeric
}
