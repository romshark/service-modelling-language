entity SocialNetwork::FriendshipRequest

properties {
    from     <-> User.outgoingFriendshipRequests
    to       <-> User.incomingFriendshipRequests
    message  Text
    creation Time
    status   ?(FriendshipRequestAccepted | FriendshipRequestDeclined)
}
