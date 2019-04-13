use {
	"std/time" 1.0
}

entity socialNetwork::FriendshipRequest {
	from     User
	to       User
	message  ?Text
	creation Time
	status   ?FriendshipRequestStatus
}
