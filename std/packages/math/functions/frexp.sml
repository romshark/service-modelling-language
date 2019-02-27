# frexp breaks $f into a normalized fraction and an integral power of two.
# It equals frac and exp satisfying $f == frac × 2 ** exp,
# with the absolute value of frac in the interval [½, 1).
function math::frexp

parameters {
	$f Float64
}

// Implementation is provided by the implementing engine
value struct {
	frac Float64,
	exp  Int32,
}
