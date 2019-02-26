# jn equals the order-n Bessel function of the first kind
function math::jn

use {
	"std" 1.0
}

parameters {
	$n Int32
	$x Float64
}

// Implementation is provided by the implementing engine
value Float64
