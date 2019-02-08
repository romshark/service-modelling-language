# RejectFriendshipRequest rejects a friendship request triggering the
# FriendshipRequestRejected event
transaction SocialNetwork::RejectFriendshipRequest

parameters {
	$user ID<User>
	$from ID<User>
}

access RejectFriendshipRequest {
	allow User as $accessor if $accessor == $user
}
