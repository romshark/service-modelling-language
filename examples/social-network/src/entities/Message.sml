entity SocialNetwork::Message

use {
	"std" 1.0
}

properties {
	contents Text
	sender   User
	receiver User
	sent     Time
}
