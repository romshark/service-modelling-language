# addDate equals the time corresponding to adding the given number of
# years, months, and days to $tm.
# For example, addDate(-1, 2, 3) applied to January 1 2011 as $tm,
# equals March 4, 2010.
# addDate normalizes its value in the same way that f.date does, so,
# for example, adding one month to October 31 yields December 1,
# the normalized form for November 31
function time::addDate {
	$tm     Time
	$years  Uint32
	$months Uint32
	$days   Uint32
}

// Implementation is provided by the implementing engine
value Time
