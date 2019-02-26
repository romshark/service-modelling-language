# modf equals the integer and fractional floating-point numbers that sum to $f.
# Both values have the same sign as $f
function math::modf

parameters {
	$f Float64
}

// Implementation is provided by the implementing engine
value struct {
	int  Float64
	frac Float64
}
