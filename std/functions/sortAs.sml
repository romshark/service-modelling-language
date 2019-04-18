// Implementation is provided by the implementing engine

# sortAs equals the sorted version of $array according to the specified $order
# and $less
function std::sortAs (
	$array Array<@T>,
	$order ?Order,
	$less  (i @T, j @T) => Bool,
) -> Array<@T>
