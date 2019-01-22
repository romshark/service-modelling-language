# AcceptFriendshipRequest declines a friendship request triggering the
# FriendshipRequestDeclined event
transaction SocialNetwork::AcceptFriendshipRequest

arguments {
	user ID<User>
	from ID<User>
}

results {
	newFriend -> User
}

access AcceptFriendshipRequest as transaction {
	allow User as accessor {
		if accessor == transaction.user
	}
}
