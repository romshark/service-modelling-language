# atan2 equals the arc tangent of $y/$x,
# using the signs of the two to determine the quadrant of the return value
function math::atan2

parameters {
	$y Float64
	$x Float64
}

// Implementation is provided by the implementing engine
value Float64
