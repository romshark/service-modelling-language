# nextAfter equals the next representable Float64 value after $x towards $y
function math::nextAfter

use {
	"std" 1.0
}

parameters {
	$x Float64
	$y Float64
}

// Implementation is provided by the implementing engine
value Float64
