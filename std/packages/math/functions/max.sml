# max equals the larger of $numbers
function math::max

parameters {
	$numbers ...@N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
