// Implementation is provided by the implementing engine

# randt equals either a random UTF-8 encoded text, or Error if $minLength is
# greater $maxLength
function crypto::randt (
	$minLength Size,
	$maxLength Size,
) -> (Text or Error)
