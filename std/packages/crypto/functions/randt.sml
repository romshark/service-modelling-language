# randt equals a random UTF-8 encoded text
function crypto::randt

use {
	"std" 1.0
}

parameters {
	$minLength Size
	$maxLength Size
}

// Implementation is provided by the implementing engine
value Text

constraints {
	require ($minLength, $maxLength) => $minLength <= $maxLength
}
