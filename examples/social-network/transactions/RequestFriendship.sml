use {
	"std"      1.0
	"std/time" 1.0
}

# RequestFriendship creates a friendship request
transaction socialNetwork::RequestFriendship (
	$sender   User,
	$receiver User,
	$message  ?socialNetwork::Text,
)

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
	Error("sender and receiver must be two different users") if
		$sender == $receiver

	AlreadyBefriended("the sender and receiver already are friends") if
		$sender in $receiver.friends

	AlreadyRequested("a similar request is already pending") if
		fetchOne<FriendshipRequest>(($fr) =>
			$fr.sender == $sender && $fr.receiver == $receiver
		) != nil

	AlreadyReceived("the receiver already sent the sender 
		another friendship request") if
		fetchOne<FriendshipRequest>(($fr) =>
			$fr.sender == $receiver && $fr.receiver == $sender
		) != nil
}

access RequestFriendship {
	allow User as $accessor if $accessor.activation != nil and
		$accessor == $sender
}
