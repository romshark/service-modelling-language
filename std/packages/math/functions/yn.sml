// Implementation is provided by the implementing engine

# yn equals the order-n Bessel function of the second kind
function math::yn (
	$n @I,
	$x @N,
) -> @N

constraints {
	require @I integer
	require @N numeric
}
