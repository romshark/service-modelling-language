# MessageReceived is emitted when a new message is received. It's received by
# the user receiving the message.
event socialNetwork::MessageReceived

properties {
	receivedMessage Message
}

access {
	allow User
}
