// Implementation is provided by the implementing engine

# sortedOn equals the sorted version of $array according to the specified $order
# and $orderBy.
function std::sortedOn (
	$array   Array<@T>,
	$order   ?Order,
	$orderBy ?(Selector<@T> or Array<Selector<@T>>),
) -> Array<@T>

constraints {
	require @T composite
}
