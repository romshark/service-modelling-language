# min equals the smaller of $numbers
function math::min

parameters {
	$numbers ...@N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
