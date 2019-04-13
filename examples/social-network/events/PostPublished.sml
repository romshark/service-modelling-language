# PostPublished is emitted when a friend published a new post. It's received by
# anyone who's allowed to access the post.
event socialNetwork::PostPublished {
	newPost Post
}

access {
	allow User
}
