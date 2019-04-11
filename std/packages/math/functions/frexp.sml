# frexp breaks $f into a normalized fraction and an integral power of two.
# It equals frac and exp satisfying $f == frac × 2 ** exp,
# with the absolute value of frac in the interval [½, 1).
function math::frexp {
	$f @N
}

// Implementation is provided by the implementing engine
value struct {
	frac @N,
	exp  @I,
}

constraints {
	require @N numeric
	require @I integer
}
