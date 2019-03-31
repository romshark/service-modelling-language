entity socialNetwork::Message

use {
	"std/time" 1.0
}

properties {
	contents Text
	sender   User
	receiver User
	sent     Time
}
