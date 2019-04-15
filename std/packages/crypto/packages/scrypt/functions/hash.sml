function scrypt::hash {
	$password Array<Byte>
	$salt     Array<Byte>
	$N        Int32
	$r        Int32
	$p        Int32
	$length   Int32
}

// Implementation is provided by the implementing engine
value Hash
