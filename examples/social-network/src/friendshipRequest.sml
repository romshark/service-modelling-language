model SocialNetwork

scalar FriendshipRequestAccepted extends Time
scalar FriendshipRequestDeclined extends Time

entity FriendshipRequest {
	from     <-> User.outgoingFriendshipRequests
	to       <-> User.incomingFriendshipRequests
	message  Text
	creation Time
	status   ?(FriendshipRequestAccepted | FriendshipRequestDeclined)
}
