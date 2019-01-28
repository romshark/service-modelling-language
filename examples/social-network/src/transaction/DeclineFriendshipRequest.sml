# DeclineFriendshipRequest declines a friendship request triggering the
# FriendshipRequestDeclined event
transaction SocialNetwork::DeclineFriendshipRequest

arguments {
	$user ID<User>
	$from ID<User>
}

access DeclineFriendshipRequest {
	allow User as accessor {
		if accessor == $user
	}
}
