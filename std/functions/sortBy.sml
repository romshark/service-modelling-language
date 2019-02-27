# sortBy equals the sorted version of $array according to the specified $order
# and $orderBy.
function std::sortBy

parameters {
	$array   Array<@T>
	$order   ?Order |> select { case ($ == nil) = Order::descending}
	$orderBy ?(Selector<@T> or Array<Selector<@T>>)
}

// Implementation is provided by the implementing engine
value Array<@T>

constraints {
	require @T composite
}