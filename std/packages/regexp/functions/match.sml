# match equals true if $string matches $expr, otherwise equals false
function regexp::match

parameters {
	$expr   RegExp
	$string (String or Text)
}

value Bool
