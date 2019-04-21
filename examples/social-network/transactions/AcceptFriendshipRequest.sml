# AcceptFriendshipRequest declines a friendship request triggering the
# FriendshipRequestAccepted event
transaction socialNetwork::AcceptFriendshipRequest (
	$request FriendshipRequest,
)

-> User => {
	// TODO
}

access AcceptFriendshipRequest {
	allow User as $accessor if $accessor == $request.to
}
