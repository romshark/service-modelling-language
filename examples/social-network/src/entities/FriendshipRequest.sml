entity SocialNetwork::FriendshipRequest

use {
	"std" 1.0
}

properties {
    from     <-> User.outgoingFriendshipRequests
    to       <-> User.incomingFriendshipRequests
    message  Text
    creation Time
    status   ?FriendshipRequestStatus
}
