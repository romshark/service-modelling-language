model SocialNetwork

# AcceptFriendshipRequest declines a friendship request triggering the
# FriendshipRequestDeclined event
transact AcceptFriendshipRequest(
	user *User
	from *User
) {
	newFriend User
}

access AcceptFriendshipRequest as accessed {
	allow User as accessor {
		if *accessor == *accessed.user
	}
}
