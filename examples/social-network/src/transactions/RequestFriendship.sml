use {
	"std"      1.0
	"std/time" 1.0
}

# RequestFriendship creates a friendship request
transaction socialNetwork::RequestFriendship {
	$sender   User
	$receiver User
	$message  ?Text
}

scope {
	$newRequest = new<FriendshipRequest>({
		from     = $sender
		to       = $receiver
		message  = $message
		creation = now()
		status   = nil
	})

	// Notify the receiver
	emit<FriendshipRequestReceived>($receiver, {
		request = $newRequest
	})
}

results {
	newRequest FriendshipRequest = $newRequest
}

errors {
	# AlreadyBefriended is returned if the sender already befriends the
	# receiver
	AlreadyBefriended if $sender in $receiver.friends

	# AlreadyRequested is returned if a similar request is pending
	AlreadyRequested if fetchOne<FriendshipRequest>(
		predicate: ($fr) => $fr.sender == $sender && $fr.receiver == $receiver
	) != nil

	# AlreadyReceived is returned if the receiving user already sent the sender
	# another friendship request
	AlreadyReceived if fetchOne<FriendshipRequest>(
		predicate: ($fr) => $fr.sender == $receiver && $fr.receiver == $sender
	) != nil
}

access RequestFriendship {
	allow User as $accessor if $accessor.activation != nil and
		$accessor == $sender
}

constraints {
	require => $sender != $receiver
}