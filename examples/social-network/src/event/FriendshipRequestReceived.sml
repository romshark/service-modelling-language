# FriendshipRequestReceived is triggered when a new friendship request from
# another user is received
event SocialNetwork::FriendshipRequestReceived

arguments {
	target ID<User>
}

properties {
	requestingUser ID<User>
}

access {
	allow User as accessor {
		if accessor == accessed.target
	}
}
