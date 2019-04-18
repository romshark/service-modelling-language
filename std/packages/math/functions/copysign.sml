// Implementation is provided by the implementing engine

# copysign equals a value with the magnitude of $x and the sign of $y
function math::copysign (
	$x @X,
	$y @Y,
) -> @X

constraints {
	require @X signed
	require @Y numeric
}
