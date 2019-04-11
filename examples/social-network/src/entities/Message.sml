use {
	"std/time" 1.0
}

entity socialNetwork::Message {
	contents Text
	sender   User
	receiver User
	sent     Time
}
