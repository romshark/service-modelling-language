# FriendshipRequestReceived is emitted when a new friendship request from
# another user is received. It's received by the receiver of the request.
event socialNetwork::FriendshipRequestReceived {
	request FriendshipRequest
}

access {
	allow User
}
