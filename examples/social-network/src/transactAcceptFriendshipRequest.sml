model SocialNetwork

# AcceptFriendshipRequest declines a friendship request triggering the
# FriendshipRequestDeclined event
transact AcceptFriendshipRequest(
	user ID<User>
	from ID<User>
) {
	newFriend User
}

access AcceptFriendshipRequest as accessed {
	allow User as accessor {
		if accessor == accessed.user
	}
}
