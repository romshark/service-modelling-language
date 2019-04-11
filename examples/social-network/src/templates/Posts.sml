use {
	"std" 1.0
}

# Posts bundles together nodes related to posts
template socialNetwork::Posts {
	*publisher (User or Organization)
}

value struct {
	# all links all posts ever created including the archived ones
	all Collection<Post> {
		predicate: ($p) => $p.publisher == *publisher
		order:     Order::desc
		orderBy:   Post.publication
	}

	# published links all currently published posts
	published Collection<Post> {
		predicate: ($p) => $p.publisher == *publisher and $p.archived == nil
		order:     Order::desc
		orderBy:   Post.publication
	}

	# archived links all archived posts
	archived Collection<Post> {
		predicate: ($p) => $p.publisher == *publisher and $p.archived != nil
		order:     Order::desc
		orderBy:   Post.publication
	}

	# trending lists the most relevant posts sorted by the number of
	# reactions
	trending Collection<Post> {
		predicate: ($p) => $p.publisher == *publisher and $p.archived == nil
		order:     Order::desc
		orderBy:   Post.reactions.all:length
	}
}
