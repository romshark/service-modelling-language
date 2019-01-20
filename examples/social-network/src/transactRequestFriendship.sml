model SocialNetwork

# RequestFriendship creates a friendship request
transact RequestFriendship(
	sender   ID<User>
	receiver ID<User>
) {
	newRequest FriendshipRequest
}

access RequestFriendship as accessed {
	allow User as accessor {
		if accessor.activation != null && accessor == sender
	}
}

# ErrAlreadyBefriended represents an error indicating that the friendship
# already exists
error ErrAlreadyBefriended {}

errors RequestFriendship as transaction {
	# ErrAlreadyBefriended is returned if the sender already befriends the
	# receiver
	ErrAlreadyBefriended if {
		transaction.sender in transaction.receiver.friends
	}
}
