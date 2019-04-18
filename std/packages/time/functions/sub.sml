// Implementation is provided by the implementing engine

# sub equals the duration $tm - $dur.
# If the result exceeds the maximum (or minimum) value that can be stored
# in a Duration, it will equal the maximum (or minimum) duration
function time::sub (
	$tm  Time,
	$dur Duration,
) -> Time
