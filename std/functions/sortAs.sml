# sortAs equals the sorted version of $array according to the specified $order
# and $less
function std::sortAs

parameters {
	$array Array<@T>
	$order ?Order |> select { case ($ == nil) = Order::desc}
	$less  (i @T, j @T) => Bool
}

// Implementation is provided by the implementing engine
value Array<@T>
