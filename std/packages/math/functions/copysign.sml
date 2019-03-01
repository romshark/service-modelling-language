# copysign equals a value with the magnitude of $x and the sign of $y
function math::copysign

parameters {
	$x @X
	$y @Y
}

// Implementation is provided by the implementing engine
value @X

constraints {
	require @X signed
	require @Y numeric
}
