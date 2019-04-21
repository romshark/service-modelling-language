# RejectFriendshipRequest rejects a friendship request triggering the
# FriendshipRequestRejected event
transaction socialNetwork::RejectFriendshipRequest (
	$request FriendshipRequest,
)

-> FriendshipRequest => {
	// TODO
}

access RejectFriendshipRequest {
	allow User as $accessor if $accessor == $request.to
}
