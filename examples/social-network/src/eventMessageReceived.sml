model SocialNetwork

# MessageReceived is triggered when a new message is received
event MessageReceived(receiver ID<User>) {
	receivedMessage Message
}

access MessageReceived as accessed {
	allow User as accessor {
		# Only the receiver may subscribe to message events
		if accessor == accessed.receiver
	}
}
