# mod equals the floating-point remainder of $x / $y.
# The magnitude of the result is less than $y
# and its sign agrees with that of $x
function math::mod

use {
	"std" 1.0
}

parameters {
	$x Float64
	$y Float64
}

// Implementation is provided by the implementing engine
value Float64
