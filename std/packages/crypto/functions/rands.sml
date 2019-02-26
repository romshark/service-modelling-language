# rands equals a random 7-bit ASCII string
function crypto::rands

use {
	"std" 1.0
}

parameters {
	$minLength Size
	$maxLength Size
}

// Implementation is provided by the implementing engine
value String

constraints {
	require ($minLength, $maxLength) => $minLength <= $maxLength
}
