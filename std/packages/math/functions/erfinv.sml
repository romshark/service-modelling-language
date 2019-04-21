// Implementation is provided by the implementing engine

# erfinv equals the inverse error function of $x
function math::erfinv ($x @N) -> @N

constraints {
	require @N numeric
}
