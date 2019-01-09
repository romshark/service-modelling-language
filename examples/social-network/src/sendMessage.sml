model SocialNetwork

# SendMessage sends a message to the receiver user from the sender user
transact SendMessage(
	sender   *User
	receiver *User
	contents Text
) {
	Message
}

# Allow sending messages to users only on their own behalf
access SendMessage as accessed {
	allow User as accessor {
		if *user == accessed.sender
	}
}
