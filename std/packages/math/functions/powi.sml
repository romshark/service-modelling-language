# powi equals to $x raised to an integer power $power.
# Using this function is generally faster than using math::powf
function math::powi

use {
	"std" 1.0
}

parameters {
	$x     Float64
	$power Int32
}

// Implementation is provided by the implementing engine
value Float64
