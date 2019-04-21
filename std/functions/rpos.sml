// Implementation is provided by the implementing engine

# rpos equals the index of the last element of $array matching $predicate
function std::rpos (
	$array     Array<@T>,
	$predicate (@T) => ?Bool,
) -> ?Size
