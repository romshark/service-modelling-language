# ldexp equals the inverse of f.frexp.
# It equals $frac × 2 ** $exp.
function math::ldexp

parameters {
	$frac Float64
	$exp  Int32
}

// Implementation is provided by the implementing engine
value Float64
