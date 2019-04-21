// Implementation is provided by the implementing engine

# log2 equals the binary logarithm of $x.
# The special cases are the same as for f.log
function math::log2 ($x @N) -> @N

constraints {
	require @N numeric
}
