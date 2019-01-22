# SendMessage sends a message to the receiver user from the sender user
transaction SocialNetwork::SendMessage

arguments {
	sender   ID<User>
	receiver ID<User>
	contents Text
}

results {
	sentMessage -> Message
}

# Allow sending messages to users only on their own behalf
access SendMessage as accessed {
	allow User as accessor {
		if accessor.activation != null && accessor == accessed.sender &&
			accessor in accessed.receiver.friends
	}
}
