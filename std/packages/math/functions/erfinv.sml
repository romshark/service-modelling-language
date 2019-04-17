# erfinv equals the inverse error function of $x
function math::erfinv ($x @N)

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
