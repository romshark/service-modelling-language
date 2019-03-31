# RejectFriendshipRequest rejects a friendship request triggering the
# FriendshipRequestRejected event
transaction SocialNetwork::RejectFriendshipRequest

parameters {
	$request FriendshipRequest
}

access RejectFriendshipRequest {
	allow User as $accessor if $accessor == $request.to
}
