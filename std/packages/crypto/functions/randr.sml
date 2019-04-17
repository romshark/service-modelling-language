# randr equals a random unlimited precision real number
function crypto::randr (
	$minLength Real,
	$maxLength Real,
)

// Implementation is provided by the implementing engine
value Real

errors {
	Error("max length must be greater or equals min length") if
		$maxLength < $minLength
}
