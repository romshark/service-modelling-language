# sort equals the sorted version of $array according to the specified $order
function std::sort {
	$array Array<@T>
	$order ?Order |> match { $ == nil = Order::desc }
}

// Implementation is provided by the implementing engine
value Array<@T>
