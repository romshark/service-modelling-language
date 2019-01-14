model SocialNetwork

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
