# RemovePost removes a published post
transaction SocialNetwork::RemovePost

arguments {
	post ID<Post>
}

access RemovePost as accessed {
	# Only users are allowed to publish posts
	allow User as accessor {
		accessed.post.publisher {
		User:
			if accessor == accessed.publisher
		}
	}
}
