# PublishPostOrganization publishes a new organization post
transaction SocialNetwork::PublishPostOrganization

use {
	"std" 1.0
}

parameters {
	$organization ID<Organization>
	$admin        ID<User>
	$content      Text
}

results {
	publishedPost Post
}

access PublishPostOrganization {
	# Only page administrators are allowed to publish posts
	allow User as $accessor if $accessor in $organization.pageAdmins
}
