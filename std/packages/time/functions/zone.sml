# zone equals the time zone in effect at time $tm,
# it equals the abbreviated name of the zone (such as "CET")
# and its offset in seconds east of UTC
function time::zone

use {
	"std" 1.0
}

parameters {
	$tm Time
}

// Implementation is provided by the implementing engine
value struct {
	name   String
	offset Int32
}
