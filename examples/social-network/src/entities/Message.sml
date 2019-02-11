entity SocialNetwork::Message

use {
	"std" 1.0
}

properties {
	contents Text
	sender   <-> User.outbox
	receiver <-> User.inbox
	sent     Time
}
