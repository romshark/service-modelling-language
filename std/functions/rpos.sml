# rpos equals the index of the last element of $array matching $predicate
function std::rpos {
	$array     Array<@T>
	$predicate (@T) => ?Bool
}

// Implementation is provided by the implementing engine
value ?Size
