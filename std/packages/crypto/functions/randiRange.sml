// Implementation is provided by the implementing engine

# randiRange equals either a random signed 32-bit integer between $min and $max,
# or Error if $min is greater $max
function crypto::randiRange (
	$min Int32,
	$max Int32,
) -> (Int32 or Error)
