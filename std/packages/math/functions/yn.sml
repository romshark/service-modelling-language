# yn equals the order-n Bessel function of the second kind
function math::yn (
	$n @I,
	$x @N,
)

// Implementation is provided by the implementing engine
value @N

constraints {
	require @I integer
	require @N numeric
}
