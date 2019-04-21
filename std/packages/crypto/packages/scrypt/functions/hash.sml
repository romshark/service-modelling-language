// Implementation is provided by the implementing engine

# hash equals an Scrypt hash
function scrypt::hash {
	$password Array<Byte>
	$salt     Array<Byte>
	$N        Int32
	$r        Int32
	$p        Int32
	$length   Int32
} -> Hash
