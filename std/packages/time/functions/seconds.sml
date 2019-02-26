# seconds equals the number of seconds in $duration
function time::seconds

use {
	"std" 1.0
}

parameters {
	$duration Duration
}

// Implementation is provided by the implementing engine
value Float64
