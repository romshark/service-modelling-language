// Implementation is provided by the implementing engine

# jn equals the order-n Bessel function of the first kind
function math::jn (
	$n @I,
	$x @N,
) -> @N

constraints {
	require @I integer
	require @N numeric
}
