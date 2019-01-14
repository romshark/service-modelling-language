model SocialNetwork

# Posts bundles together nodes related to posts
struct Posts {
	# all links all posts ever created including the archived ones
	all <-> []Post.publisher as posts {
		sort desc posts.publication
	}

	# published links all currently published posts
	published -> posts as posts {
		sort   desc posts.publication
		filter posts.archived == null
	}

	# archived links all archived posts
	archived -> posts as posts {
		sort   desc posts.publication
		filter posts.archived != null
	}

	# trending lists the most relevant posts sorted by the number of
	# reactions
	trending -> published as posts {
		sort desc posts.reactions.all:length
	}
}
