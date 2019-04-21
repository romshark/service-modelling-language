// Implementation is provided by the implementing engine

# rands equals either a random 7-bit ASCII string, or Error if $minLength is
# greater $maxLength
function crypto::rands (
	$minLength Size,
	$maxLength Size,
) -> (Array<Byte> or Error)
