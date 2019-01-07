model SocialNetwork

# MessageReceived is triggered when a new message is received
event MessageReceived(receiver *User) {
	receivedMessage Message
}

access MessageReceived {
	User {
		# Only the receiver may subscribe to message events
		*accessor == *accessed.receiver
	}
}

# FriendshipRequestReceived is triggered when a new friendship request from
# another user is received
event FriendshipRequestReceived {
	requestingUser *User
}

access FriendshipRequestReceived(target *User) {
	User {
		*accessor == *accessed.target
	}
}

# PostPublished is triggered when a friend published a new post
event PostPublished(user *User) {
	requestingUser *User
}

access PostPublished(user *User) {
	User {
		*accessor == *accessed.user
	}
}

# FriendshipRequestDeclined is triggered when a friendship request initiated by
# the given user is declined
FriendshipRequestDeclined(user *User) {
	request FriendshipRequest
}

access FriendshipRequestDeclined {
	User {
		*accessor == *accessed.user
	}
}

# FriendshipRequestAccepted is triggered when a friendship request initiated by
# the given user is accepted
FriendshipRequestAccepted(user *User) {
	request FriendshipRequest
}

access FriendshipRequestAccepted {
	User {
		*accessor == *accessed.user
	}
}
