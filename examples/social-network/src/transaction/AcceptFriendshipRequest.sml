# AcceptFriendshipRequest declines a friendship request triggering the
# FriendshipRequestDeclined event
transaction SocialNetwork::AcceptFriendshipRequest

arguments {
	$user ID<User>
	$from ID<User>
}

results {
	newFriend -> User
}

access AcceptFriendshipRequest {
	allow User as accessor {
		if accessor == $user
	}
}
