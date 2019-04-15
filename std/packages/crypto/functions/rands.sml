# rands equals a random 7-bit ASCII string
function crypto::rands {
	$minLength Size
	$maxLength Size
}

// Implementation is provided by the implementing engine
value String

errors {
	Error("max length must be greater or equals min length") if
		$maxLength < $minLength
}
