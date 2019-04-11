# pos equals the index of the first element of $array matching $predicate
function std::pos {
	$array     Array<@T>
	$predicate (@T) => ?Bool
}

// Implementation is provided by the implementing engine
value ?Size
