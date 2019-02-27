entity SocialNetwork::FriendshipRequest

use {
	"std" 1.0
}

properties {
	from     User
	to       User
	message  Text
	creation Time
	status   ?FriendshipRequestStatus
}
