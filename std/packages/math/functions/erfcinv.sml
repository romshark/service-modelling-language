# erfcinv equals the inverse of f.erfc($x)
function math::erfcinv ($x @N)

// Implementation is provided by the implementing engine
value @N

constraints {
	require @N numeric
}
