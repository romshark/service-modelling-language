// Implementation is provided by the implementing engine

# lgamma equals the natural logarithm and sign (-1 or +1) of Gamma($x).
function math::lgamma ($x @N) -> struct {
	lgamma @N
	sign   @I
}

constraints {
	require @N numeric
	require @I integer
}
