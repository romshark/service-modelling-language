model SocialNetwork

# MessageReceived is triggered when a new message is received
event MessageReceived(receiver *User) {
	receivedMessage Message
}

access MessageReceived as accessed {
	allow User as accessor {
		# Only the receiver may subscribe to message events
		if *accessor == *accessed.receiver
	}
}

# FriendshipRequestReceived is triggered when a new friendship request from
# another user is received
event FriendshipRequestReceived(target *User) {
	requestingUser *User
}

access FriendshipRequestReceived as accessed {
	allow User as accessor {
		if *accessor == *accessed.target
	}
}

# PostPublished is triggered when a friend published a new post
event PostPublished(user *User) {
	requestingUser *User
}

access PostPublished as accessed {
	allow User as accessor {
		if *accessor == *accessed.user
	}
}

# FriendshipRequestDeclined is triggered when a friendship request initiated by
# the given user is declined
event FriendshipRequestDeclined(user *User) {
	request FriendshipRequest
}

access FriendshipRequestDeclined as accessed {
	allow User as accessor {
		if *accessor == *accessed.user
	}
}

# FriendshipRequestAccepted is triggered when a friendship request initiated by
# the given user is accepted
event FriendshipRequestAccepted(user *User) {
	request FriendshipRequest
}

access FriendshipRequestAccepted as accessed {
	allow User as accessor {
		if *accessor == *accessed.user
	}
}
