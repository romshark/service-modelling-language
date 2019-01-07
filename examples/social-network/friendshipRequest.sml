model SocialNetwork

scalar FriendshipRequestAccepted = Time
scalar FriendshipRequestDeclined = Time

entity FriendshipRequest {
	from     User
	to       User
	message  Text
	creation Time
	status   ?(FriendshipRequestAccepted | FriendshipRequestDeclined)
}

relation FriendshipRequestSource:
	User <-> []FriendshipRequest(from, outgoingFriendshipRequests)

relation FriendshipRequestTarget:
	User <-> []FriendshipRequest(from, incomingFriendshipRequests)
