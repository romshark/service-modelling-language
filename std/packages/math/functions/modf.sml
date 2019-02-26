# modf equals the integer and fractional floating-point numbers that sum to $f.
# Both values have the same sign as $f
function math::modf

use {
	"std" 1.0
}

parameters {
	$f Float64
}

// Implementation is provided by the implementing engine
value struct {
	int  Float64
	frac Float64
}
