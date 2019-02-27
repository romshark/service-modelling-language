# isInf equals true if $f is an infinity, according to $sign.
# If $sign > 0, isInf equals positive infinity.
# If $sign < 0, isInf equals negative infinity.
# If $sign == 0, isInf equals either infinity.
function math::isInf

parameters {
	$f    Float64
	$sign Int32
}

// Implementation is provided by the implementing engine
value Bool
