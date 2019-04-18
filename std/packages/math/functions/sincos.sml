// Implementation is provided by the implementing engine

# sincos equals f.sin($x), f.cos($x).
function math::sincos ($x @N) -> struct {
	sin @N
	cos @N
}

constraints {
	require @N numeric
}
