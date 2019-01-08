model SocialNetwork

# Posts bundles together nodes related to posts
struct Posts {
	# all links all posts ever created including the archived ones
	all []Post {
		sort desc Post.publication
	}

	# published links all currently published posts
	published -> posts {
		sort   desc Post.publication
		filter Post.archived == null
	}

	# archived links all archived posts
	archived -> posts {
		sort   desc Post.publication
		filter Post.archived != null
	}

	# trending lists the most relevant posts sorted by the number of
	# reactions
	trending -> published {
		sort desc Post.reactions:length
	}
}
