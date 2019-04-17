# mod equals the floating-point remainder of $x / $y.
# The magnitude of the result is less than $y
# and its sign agrees with that of $x
function math::mod (
	$x @N,
	$y @N,
)

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
