# RequestFriendship creates a friendship request
transaction SocialNetwork::RequestFriendship

arguments {
	sender   ID<User>
	receiver ID<User>
}

results {
	newRequest -> FriendshipRequest
}

errors RequestFriendship as transaction {
	# ErrAlreadyBefriended is returned if the sender already befriends the
	# receiver
	ErrAlreadyBefriended if {
		transaction.sender in transaction.receiver.friends
	}
}

access RequestFriendship {
	allow User as accessor {
		if accessor.activation != null && accessor == this.sender
	}
}
