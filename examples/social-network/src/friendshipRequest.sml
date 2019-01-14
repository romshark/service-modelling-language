model SocialNetwork

scalar FriendshipRequestAccepted = Time
scalar FriendshipRequestDeclined = Time

entity FriendshipRequest {
	from     <-> User.outgoingFriendshipRequests
	to       <-> User.incomingFriendshipRequests
	message  Text
	creation Time
	status   ?(FriendshipRequestAccepted | FriendshipRequestDeclined)
}
