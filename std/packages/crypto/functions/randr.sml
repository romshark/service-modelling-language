# randr equals a random unlimited precision real number
function crypto::randr

use {
	"std" 1.0
}

parameters {
	$minLength Real
	$maxLength Real
}

// Implementation is provided by the implementing engine
value Real

constraints {
	require ($minLength, $maxLength) => $minLength <= $maxLength
}
