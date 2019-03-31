# FriendshipRequestRejected is emitted when a friendship request is rejected.
# It's received by both the sender and the receiver of the request.
event socialNetwork::FriendshipRequestRejected

properties {
	request FriendshipRequest
}

access {
	allow User
}
