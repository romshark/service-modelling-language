model SocialNetwork

entity Message {
	contents Text
	sender   User
	receiver User
	sent     Time
}

relation SentMessage: []Message <-> User (sender, outbox)
relation SentMessage: []Message <-> User (receiver, inbox)
