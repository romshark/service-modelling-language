# randiRange equals a random signed 32-bit integer between $min and $max
function crypto::randiRange

use {
	"std" 1.0
}

parameters {
	$min Int32
	$max Int32
}

// Implementation is provided by the implementing engine
value Int32

constraints {
	require ($min, $max) => $min <= $max
}
