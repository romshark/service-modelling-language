// Implementation is provided by the implementing engine

# log10 equals the decimal logarithm of $x.
# The special cases are the same as for f.log
function math::log10 ($x @N) -> @N

constraints {
	require @N numeric
}
