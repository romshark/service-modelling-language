# sum equals the sum of the 
function math::sum

parameters {
	numbers ...@N
}

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
