// Implementation is provided by the implementing engine

# match equals true if $string matches $expr, otherwise equals false
function regexp::match (
	$string (Text or Array<Byte>),
	$expr   RegExp,
) -> Bool
