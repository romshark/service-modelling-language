model SocialNetwork

# PublishPostBusiness publishes a new business post
transact PublishPostBusiness (
	business *Business
	admin    *User
	content  Text
) {
	publishedPost Post
}

access PublishPostBusiness {
	# Only page administrators are allowed to publish posts
	User {
		*accessor in accessed.business.pageAdmins
	}
}

# PublishPostBusinessDraft publishes a post draft
transact PublishPostBusinessDraft (post *Post) {
	publishedPost Post
}

access PublishPostBusinessDraft {
	# Only page administrators are allowed to publish posts
	User {
		*accessor in accessed.business.pageAdmins
	}
}

errors PublishPostBusiness {
	# ErrPostAlreadyPublished is thrown if the given post is already published
	ErrPostAlreadyPublished
}

errors PublishPostBusinessDraft {
	# ErrPostNotDraft is thrown if the given post is not a draft
	ErrPostNotDraft

	# ErrPostAlreadyPublished is thrown if the given post is already published
	ErrPostAlreadyPublished
}
