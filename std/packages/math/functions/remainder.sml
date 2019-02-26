# remainder equals the IEEE 754 floating-point remainder of $x / $y.
function math::remainder

use {
	"std" 1.0
}

parameters {
	$x Float64
	$y Float64
}

// Implementation is provided by the implementing engine
value Float64
