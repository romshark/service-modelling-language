model SocialNetwork

# PublishPostOrganization publishes a new organization post
transact PublishPostOrganization (
	organization *Organization
	admin        *User
	content      Text
) {
	publishedPost Post
}

access PublishPostOrganization as accessed {
	# Only page administrators are allowed to publish posts
	allow User as accessor {
		if *accessor in accessed.organization.pageAdmins
	}
}