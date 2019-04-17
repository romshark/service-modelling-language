# randRange equals a random number between $min and $max
function crypto::randRange (
	$min @T,
	$max @T,
)

// Implementation is provided by the implementing engine
value @T

constraints {
	require @T numeric
}

errors {
	Error("max must be greater or equals min") if $max < $min
}
