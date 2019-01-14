model SocialNetwork

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
