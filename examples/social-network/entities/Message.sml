use {
	"std/time" 1.0
}

entity socialNetwork::Message {
	contents socialNetwork::Text
	sender   User
	receiver User
	sent     Time
}
