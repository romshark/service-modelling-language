entity socialNetwork::FriendshipRequest

use {
	"std/time" 1.0
}

properties {
	from     User
	to       User
	message  ?Text
	creation Time
	status   ?FriendshipRequestStatus
}
