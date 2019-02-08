# RequestFriendship creates a friendship request
transaction SocialNetwork::RequestFriendship

parameters {
	$sender   ID<User>
	$receiver ID<User>
}

results {
	newRequest FriendshipRequest
}

errors RequestFriendship {
	# ErrAlreadyBefriended is returned if the sender already befriends the
	# receiver
	ErrAlreadyBefriended if {
		$sender in $receiver.friends
	}
}

access RequestFriendship {
	allow User as $accessor if $accessor.activation != nil &&
		$accessor == $sender
}
