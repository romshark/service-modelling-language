// Implementation is provided by the implementing engine

# erfc equals the complementary error function of $x
function math::erfc ($x @N) -> @N

constraints {
	require @N numeric
}
