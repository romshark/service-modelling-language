# sincos equals f.sin($x), f.cos($x).
function math::sincos

use {
	"std" 1.0
}

parameters {
	$x Float64
}

// Implementation is provided by the implementing engine
value struct {
	sin Float64
	cos Float64
}
