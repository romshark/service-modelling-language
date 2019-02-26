# rpos equals the index of the last element of $array matching $predicate
function std::rpos

parameters {
	$array     Array<@T>
	$predicate (@T) => ?Bool
}

// Implementation is provided by the implementing engine
value ?Size
