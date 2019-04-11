# signBit equals true if $x is negative or negative zero.
function math::signBit {
	$x @N
}

// Implementation is provided by the implementing engine
value Bool

constraints {
	require @N numeric
}
