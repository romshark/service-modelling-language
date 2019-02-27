# format equals a textual representation of $tm value
# formatted according to $layout, which defines the format by showing
# how the reference time, defined to be "Mon Jan 2 15:04:05 -0700 MST 2006"
# would be displayed if it were the value;
# A fractional second is represented by adding a period and zeros to the end of
# the seconds section of layout string, as in "15:04:05.000" to format
# a time stamp with millisecond precision
# Predefined layouts ANSIC, UnixDate, RFC3339 and others
# describe standard and convenient representations of the reference time.
function time::format

parameters {
	$tm     Time
	$layout String
}

// Implementation is provided by the implementing engine
value String
