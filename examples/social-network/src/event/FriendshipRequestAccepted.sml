# FriendshipRequestAccepted is triggered when a friendship request initiated by
# the given user is accepted
event SocialNetwork::FriendshipRequestAccepted

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
