# FriendshipRequestRejected is triggered when a friendship request initiated by
# the given user is rejected
event SocialNetwork::FriendshipRequestRejected

arguments {
	user ID<User>
}

properties {
	request FriendshipRequest
}

access {
	allow User as accessor {
		if accessor == this.user
	}
}

