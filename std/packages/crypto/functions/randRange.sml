// Implementation is provided by the implementing engine

# randRange equals either a random number between $min and $max, or Error if
# $min is greater $max
function crypto::randRange (
	$min @T,
	$max @T,
) -> (@T or Error)

constraints {
	require @T numeric
}
