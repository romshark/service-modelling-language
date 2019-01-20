model SocialNetwork

# RemovePost removes a published post
transact RemovePost (post ID<Post>)

access RemovePost as accessed {
	# Only users are allowed to publish posts
	allow User as accessor {
		accessed.post.publisher {
		User:
			if accessor == accessed.publisher
		}
	}
}
