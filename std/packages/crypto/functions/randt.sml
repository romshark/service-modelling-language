# randt equals a random UTF-8 encoded text
function crypto::randt {
	$minLength Size
	$maxLength Size
}

// Implementation is provided by the implementing engine
value Text

constraints {
	require ($minLength, $maxLength) => $minLength <= $maxLength
}
