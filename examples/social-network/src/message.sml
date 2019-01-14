model SocialNetwork

entity Message {
	contents Text
	sender   <-> User.outbox
	receiver <-> User.inbox
	sent     Time
}
