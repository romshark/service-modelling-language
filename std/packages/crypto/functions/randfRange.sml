// Implementation is provided by the implementing engine

# randfRange equals either a random signed 64-bit floating point number
# between $min and $max, or Error if $min is greater $max
function crypto::randfRange (
	$min Float64,
	$max Float64,
) -> (Float64 or Error)
