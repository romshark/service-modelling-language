# hypot equals f.sqrt($p * $p + $q * $q),
# taking care to avoid unnecessary overflow and underflow
function math::hypot (
	$p @N,
	$q @N,
)

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
