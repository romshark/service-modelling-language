// Implementation is provided by the implementing engine

# any equals true if any element of $array matches $predicate.
# It applies the $predicate function to each element of $array,
# and if any of them equal true, then so does f.any,
# if they all equal false, then so does f.any.
# If any of applied $predicate functions equals nil
# then it's counted as it was false.
# If $array is empty then f.any equals false by default
function std::any (
	$array     Array<@T>,
	$predicate (@T) => ?Bool,
) -> Bool
