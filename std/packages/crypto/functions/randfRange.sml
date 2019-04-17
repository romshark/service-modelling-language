# randfRange equals a random signed 64-bit floating point number
# between $min and $max
function crypto::randfRange (
	$min Float64,
	$max Float64,
)

// Implementation is provided by the implementing engine
value Float64

errors {
	Error("max must be greater or equals min") if $max < $min
}
