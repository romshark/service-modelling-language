model SocialNetwork

# PublishPostOrganization publishes a new organization post
transact PublishPostOrganization (
	organization *Organization
	admin        *User
	content      Text
) {
	publishedPost Post
}

access PublishPostOrganization {
	# Only page administrators are allowed to publish posts
	User {
		*accessor in accessed.organization.pageAdmins
	}
}
