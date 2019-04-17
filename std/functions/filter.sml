# filter equals the array of elements of $array that match $predicate.
# The $predicate function is applied to each element of $array and includes the
# element if $predicate equals true, otherwise the element is excluded
function std::filter (
	$array     Array<@T>,
	$predicate (@T) => ?Bool,
)

// Implementation is provided by the implementing engine
value Array<@T>
