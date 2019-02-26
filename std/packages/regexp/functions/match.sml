# match equals true if $string matches $expr, otherwise equals false
function regexp::match

use {
	"std" 1.0
}

parameters {
	$expr   RegExp
	$string (String or Text)
}

value Bool
