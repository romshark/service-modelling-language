# Posts bundles together nodes related to posts
struct SocialNetwork::Posts

properties {
	# all links all posts ever created including the archived ones
	all <-> []Post.publisher |>
		sort $ desc Post.publication

	# published links all currently published posts
	published -> []Post = this.all |>
		filter $ ($p) => $p.archived == nil |>
		sort $ desc Post.publication

	# archived links all archived posts
	archived -> []Post = this.all |>
		filter $ ($p) => $p.archived != nil |>
		sort $ desc Post.publication

	# trending lists the most relevant posts sorted by the number of
	# reactions
	trending -> []Post = this.published |>
		sort $ desc Post.reactions.all:length
}
