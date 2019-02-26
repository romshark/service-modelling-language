# powf equals $x raised to a floating point power $power
function math::powf

use {
	"std" 1.0
}

parameters {
	$x     Float64
	$power Float64
}

// Implementation is provided by the implementing engine
value Float64
