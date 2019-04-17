# sortBy equals the sorted version of $array according to the specified $order
# and $orderBy.
function std::sortBy (
	$array   Array<@T>,
	$order   ?Order,
	$orderBy ?(Selector<@T> or Array<Selector<@T>>),
)

// Implementation is provided by the implementing engine
value Array<@T>

constraints {
	require @T composite
}
