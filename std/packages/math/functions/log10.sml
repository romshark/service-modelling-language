# log10 equals the decimal logarithm of $x.
# The special cases are the same as for f.log
function math::log10

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
