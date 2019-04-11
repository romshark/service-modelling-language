# exp equals e ** $x, the base-e exponential of $x
function math::exp {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
