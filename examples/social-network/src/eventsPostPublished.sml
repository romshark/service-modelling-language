model SocialNetwork

# PostPublished is triggered when a friend published a new post
event PostPublished(user ID<User>) {
	requestingUser ID<User>
}

access PostPublished as accessed {
	allow User as accessor {
		if accessor == accessed.user
	}
}
