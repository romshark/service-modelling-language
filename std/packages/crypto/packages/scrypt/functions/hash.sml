function scrypt::hash

use {
	"std" 1.0
}

parameters {
	$password String
	$salt     String
	$N        Int32
	$r        Int32
	$p        Int32
	$length   Int32
}

// Implementation is provided by the implementing engine
value Hash
