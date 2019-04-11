# each applies $func to each element in $array
function std::each {
	$array Array<@T>
	$func  (@T) => nil
}

// Implementation is provided by the implementing engine
value Array<@T>
