# date equals the year, month, and day in which $tm occurs
function time::date

parameters {
	$tm Time
}

// Implementation is provided by the implementing engine
value struct {
	year  Uint32
	month Month
	day   Uint32
}
