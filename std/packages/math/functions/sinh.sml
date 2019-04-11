# sinh equals the hyperbolic sine of $x
function math::sinh {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
