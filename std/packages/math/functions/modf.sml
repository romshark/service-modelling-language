// Implementation is provided by the implementing engine

# modf equals the integer and fractional floating-point numbers that sum to $f.
# Both values have the same sign as $f
function math::modf ($f @N) -> struct {
	int  @N
	frac @N
}

constraints {
	require @N numeric
}
