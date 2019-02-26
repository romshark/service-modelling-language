# sincos equals f.sin($x), f.cos($x).
function math::sincos

parameters {
	$x Float64
}

// Implementation is provided by the implementing engine
value struct {
	sin Float64
	cos Float64
}
