model SocialNetwork

# PostPublished is triggered when a friend published a new post
event PostPublished(user *User) {
	requestingUser *User
}

access PostPublished as accessed {
	allow User as accessor {
		if *accessor == *accessed.user
	}
}
