# PublishPost publishes a new post
transaction SocialNetwork::PublishPost

arguments {
	$author  ID<User>
	$content Text

	# access defines the access permissions to the new post. The post will be
	# made private by default if the access permissions aren't specified
	$access ?VisibilityPermissionForm
}

results {
	publishedPost Post
}

access PublishPost {
	# Allow users to publish posts on their own behalf only and only if their
	# account has already been activated
	allow User as accessor {
		if accessor.activation != null && accessor == $author
	}
}
