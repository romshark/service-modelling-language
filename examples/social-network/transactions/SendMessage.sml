use {
	"std"      1.0
	"std/time" 1.0
}

# SendMessage sends a message to the receiver user from the sender user
transaction socialNetwork::SendMessage (
	$sender   User,
	$receiver User,
	$contents socialNetwork::Text,
)

-> (Error or Message) = {
	& = $newMessage

	// Notify the receiver
	emit<MessageReceived>($receiver, {
		receivedMessage: $newMessage
	})

	$newMessage = new<Message>({
		contents: $contents
		sender:   $sender
		receiver: $receiver
		sent:     now()
	}) as Message
}

# Allow sending messages to users only on their own behalf
access SendMessage {
	allow User as $accessor if $accessor.activation != nil and
		$accessor == $sender and
		$accessor in $receiver.friends
}
