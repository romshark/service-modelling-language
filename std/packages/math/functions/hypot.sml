# hypot equals f.sqrt($p * $p + $q * $q),
# taking care to avoid unnecessary overflow and underflow
function math::hypot

parameters {
	$p Float64
	$q Float64
}

// Implementation is provided by the implementing engine
value Float64
