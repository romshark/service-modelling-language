// Implementation is provided by the implementing engine

# expm1 equals e ** $x - 1, the base-e exponential of $x minus 1.
# It is more accurate than f.exp($x) - 1 when $x is near zero.
function math::expm1 ($x @N) -> @N

constraints {
	require @N numeric
}
