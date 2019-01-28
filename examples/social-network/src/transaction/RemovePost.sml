# RemovePost removes a published post
transaction SocialNetwork::RemovePost

arguments {
	$post ID<Post>
}

access RemovePost {
	# Only users are allowed to publish posts
	allow User as accessor {
		$post.publisher {
		User:
			if accessor == $post.publisher
		}
	}
}
