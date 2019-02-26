# exp equals e ** $x, the base-e exponential of $x
function math::exp

use {
	"std" 1.0
}

parameters {
	$x Float64
}

// Implementation is provided by the implementing engine
value Float64
