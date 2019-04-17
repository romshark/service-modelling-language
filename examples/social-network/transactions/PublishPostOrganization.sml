use {
	"std" 1.0
}

# PublishPostOrganization publishes a new organization post
transaction socialNetwork::PublishPostOrganization (
	$organization ID<Organization>,
	$admin        ID<User>,
	$content      socialNetwork::Text,
)

results {
	publishedPost Post
}

access PublishPostOrganization {
	# Only page administrators are allowed to publish posts
	allow User as $accessor if $accessor in $organization.pageAdmins
}
