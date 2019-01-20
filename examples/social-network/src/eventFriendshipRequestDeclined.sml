model SocialNetwork

# FriendshipRequestDeclined is triggered when a friendship request initiated by
# the given user is declined
event FriendshipRequestDeclined(user ID<User>) {
	request FriendshipRequest
}

access FriendshipRequestDeclined as accessed {
	allow User as accessor {
		if accessor == accessed.user
	}
}
