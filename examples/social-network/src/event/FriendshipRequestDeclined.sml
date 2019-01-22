# FriendshipRequestDeclined is triggered when a friendship request initiated by
# the given user is declined
event SocialNetwork::FriendshipRequestDeclined

arguments {
	user ID<User>
}

properties {
	request FriendshipRequest
}

access {
	allow User as accessor {
		if accessor == accessed.user
	}
}
