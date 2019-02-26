# log1p equals the natural logarithm of 1 plus its argument $x.
# It is more accurate than f.log(1 + $x) when $x is near zero
function math::log1p

use {
	"std" 1.0
}

parameters {
	$x Float64
}

// Implementation is provided by the implementing engine
value Float64
