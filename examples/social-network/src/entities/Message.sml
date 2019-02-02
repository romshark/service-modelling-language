entity SocialNetwork::Message

properties {
	contents Text
	sender   <-> User.outbox
	receiver <-> User.inbox
	sent     Time
}
