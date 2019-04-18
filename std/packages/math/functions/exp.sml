// Implementation is provided by the implementing engine

# exp equals e ** $x, the base-e exponential of $x
function math::exp ($x @N) -> @N

constraints {
	require @N numeric
}
