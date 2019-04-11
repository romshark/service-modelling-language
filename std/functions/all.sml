# all equals true if all of the elements of $array match $predicate,
# otherwise it equals false.
# It applies the $predicate function to each element of $array,
# and if any of them equal false, then so does f.all,
# if they all equal true, then so does f.all.
# If any of applied $predicate equals nil then it's counted as it was false.
# If $array is empty then f.all equals true by default
function std::all {
	$array     Array<@T>
	$predicate (@T) => ?Bool
}

// Implementation is provided by the implementing engine
value Bool
