# log1p equals the natural logarithm of 1 plus its argument $x.
# It is more accurate than f.log(1 + $x) when $x is near zero
function math::log1p

parameters {
	$x @N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
