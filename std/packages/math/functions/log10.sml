# log10 equals the decimal logarithm of $x.
# The special cases are the same as for f.log
function math::log10

use {
	"std" 1.0
}

parameters {
	$x Float64
}

// Implementation is provided by the implementing engine
value Float64
