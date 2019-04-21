use {
	"std" 1.0
}

# RemovePost removes a published post
transaction socialNetwork::RemovePost ($post Post)

-> Nothing => {
	// TODO
}

access RemovePost {
	# Only users are allowed to publish posts
	allow User as $accessor if $post.publisher as $v {
		User         then $accessor == $v
		Organization then $accessor in $v.pageAdmins
	}
}
