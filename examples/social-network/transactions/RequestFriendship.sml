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

-> (Error or FriendshipRequest) = {
	& = match {
		$sender == $receiver then Error(
			"sender and receiver must be two different users")
		
		$sender in $receiver.friends then Error<AlreadyBefriended>(
				"the sender and receiver already are friends")

		$similarRequestIsPending then Error<AlreadyRequested>(
			"a similar request is already pending")

		$receiverSentRequest then Error<AlreadyReceived>(
			"the receiver already sent the sender another friendship request")

		else $newRequest
	}

	$similarRequestIsPending = entity<FriendshipRequest>(($fr) =>
		$fr.sender == $sender and $fr.receiver == $receiver
	) != nil

	$receiverSentRequest = entity<FriendshipRequest>(($fr) =>
		$fr.sender == $receiver and $fr.receiver == $sender
	) != nil

	// Notify the receiver
	emit<FriendshipRequestReceived>($receiver, {
		request = $newRequest
	})

	$newRequest = new<FriendshipRequest>({
		from     = $sender
		to       = $receiver
		message  = $message
		creation = now()
		status   = nil
	})
}

access RequestFriendship {
	allow User as $accessor if $accessor.activation != nil and
		$accessor == $sender
}
