# lgamma equals the natural logarithm and sign (-1 or +1) of Gamma($x).
function math::lgamma

parameters {
	$x Float64
}

// Implementation is provided by the implementing engine
value struct {
	lgamma Float64
	sign   Int32
}
