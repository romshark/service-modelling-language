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
