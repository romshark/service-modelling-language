# sub equals the duration $tm - $dur.
# If the result exceeds the maximum (or minimum) value that can be stored
# in a Duration, it will equal the maximum (or minimum) duration
function time::sub

parameters {
	$tm  Time
	$dur Duration
}

// Implementation is provided by the implementing engine
value Time