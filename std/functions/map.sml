// Implementation is provided by the implementing engine

# map equals a transformed version $array.
#
# The $transformation function is applied to each element of $array and its
# value is included in the value of f.map
function std::map (
	$array          Array<@A>,
	$transformation (@A) => @B,
) -> Array<@B>
