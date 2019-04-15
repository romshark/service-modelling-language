use {
	"std" 1.0
}

# posts bundles together nodes related to posts
template socialNetwork::posts {
	*publisher (User or Organization)
}

value struct {
	# all links all posts ever created including the archived ones
	all collection<Post>(
		($p) => $p.publisher == *publisher,
		Order::desc,
		Post.publication,
	)

	# published links all currently published posts
	published collection<Post>(
		($p) => $p.publisher == *publisher and $p.archived == nil,
		Order::desc,
		Post.publication,
	)

	# archived links all archived posts
	archived collection<Post>(
		($p) => $p.publisher == *publisher and $p.archived != nil,
		Order::desc,
		Post.publication,
	)

	# trending lists the most relevant posts sorted by the number of
	# reactions
	trending collection<Post>(
		($p) => $p.publisher == *publisher and $p.archived == nil,
		Order::desc,
		Post.reactions.all:length,
	)
}
