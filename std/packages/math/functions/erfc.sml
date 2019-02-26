# erfc equals the complementary error function of $x
function math::erfc

use {
	"std" 1.0
}

parameters {
	$x Float64
}

// Implementation is provided by the implementing engine
value Float64
