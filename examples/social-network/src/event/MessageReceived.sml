# MessageReceived is triggered when a new message is received
event SocialNetwork::MessageReceived

arguments {
	receiver ID<User>
}

properties {
	receivedMessage Message
}

access {
	allow User as accessor {
		# Only the receiver may subscribe to message events
		if accessor == this.receiver
	}
}
