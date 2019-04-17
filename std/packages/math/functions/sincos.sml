# sincos equals f.sin($x), f.cos($x).
function math::sincos ($x @N)

// Implementation is provided by the implementing engine
value struct {
	sin @N
	cos @N
}

constraints {
	require @N numeric
}
