# RemovePost removes a published post
transaction socialNetwork::RemovePost

use {
	"std" 1.0
}

parameters {
	$post Post
}

access RemovePost {
	# Only users are allowed to publish posts
	allow User as $accessor if typeof $post.publisher as $v {
		User         = $accessor == $v
		Organization = $accessor in $v.pageAdmins
	}
}
