# randiRange equals a random signed 32-bit integer between $min and $max
function crypto::randiRange {
	$min Int32
	$max Int32
}

// Implementation is provided by the implementing engine
value Int32

errors {
	Error("max must be greater or equals min") if $max < $min
}
