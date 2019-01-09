model SocialNetwork

# PublishPost publishes a new post
transact PublishPost (
	author  *User
	content Text

	# access defines the access permissions to the new post. The post will be
	# made private by default if the access permissions aren't specified
	access ?VisibilityPermissionForm
) {
	publishedPost Post
}

access PublishPost as accessed {
	# Allow users to publish posts on their own behalf only
	allow User as accessor {
		if *accessor == accessed.author
	}
}
