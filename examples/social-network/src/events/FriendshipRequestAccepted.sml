# FriendshipRequestAccepted is emitted when a friendship request is accepted.
# It's received by both the sender and the receiver of the request.
event SocialNetwork::FriendshipRequestAccepted

properties {
	request FriendshipRequest
}

access {
	allow User
}