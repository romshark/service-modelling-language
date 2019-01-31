# PostPublished is triggered when a friend published a new post
event SocialNetwork::PostPublished

properties {
	newPost Post
}

access {
	allow User
}
