# PostPublished is triggered when a friend published a new post
event SocialNetwork::PostPublished

arguments {
	user ID<User>
}

properties {
	requestingUser ID<User>
}

access {
	allow User as accessor {
		if accessor == accessed.user
	}
}
