# inf equals positive infinity if $sign >= 0,
# negative infinity if $sign < 0.
function math::inf {
	$sign @I
}

// Implementation is provided by the implementing engine
value Float64

constraints {
	require @I integer
}
