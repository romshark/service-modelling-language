model SocialNetwork

# PublishPost publishes a new post
transact PublishPost (
	author      *User
	content     Text

	# access defines the access permissions to the new post. The post will be
	# made private by default if the access permissions aren't specified
	access ?VisibilityPermission
) {
	publishedPost Post
}

access PublishPost {
	# Only users are allowed to publish posts
	User
}

# PublishPostDraft publishes a post draft
transact PublishPostDraft (
	post *Post

	# access defines the access permissions to the new post. The post will be
	# made private by default if the access permissions aren't specified
	access ?VisibilityPermission
) {
	publishedPost Post
}

access PublishPostDraft {
	# Only users are allowed to publish posts
	User
}

error ErrPostAlreadyPublished {}
error ErrPostNotDraft {}

errors PublishPost {
	# ErrPostAlreadyPublished is thrown if the given post is already published
	ErrPostAlreadyPublished
}

errors PublishPostDraft {
	# ErrPostNotDraft is thrown if the given post is not a draft
	ErrPostNotDraft

	# ErrPostAlreadyPublished is thrown if the given post is already published
	ErrPostAlreadyPublished
}
