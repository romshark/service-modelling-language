// Implementation is provided by the implementing engine

# randr equals either a random unlimited precision real number, or Error if
# $minLength is greater $maxLength
function crypto::randr (
	$minLength Real,
	$maxLength Real,
) -> (Real or Error)
