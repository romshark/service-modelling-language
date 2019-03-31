# AcceptFriendshipRequest declines a friendship request triggering the
# FriendshipRequestAccepted event
transaction SocialNetwork::AcceptFriendshipRequest

parameters {
	$request FriendshipRequest
}

results {
	newFriend User
}

access AcceptFriendshipRequest {
	allow User as $accessor if $accessor == $request.to
}
