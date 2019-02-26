# copysign equals a value with the magnitude of $x and the sign of $y
function math::copysign

use {
	"std" 1.0
}

parameters {
	$x Float64
	$y Float64
}

// Implementation is provided by the implementing engine
value Float64
