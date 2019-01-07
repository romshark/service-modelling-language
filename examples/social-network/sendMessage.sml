model SocialNetwork

# SendMessage sends a message to the receiver user from the sender user
transact SendMessage(
	sender   *User
	receiver *User
	contents Text
) {
	Message
}
