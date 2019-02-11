# Posts bundles together nodes related to posts
struct SocialNetwork::Posts

use {
	"std" 1.0
}

properties {
	# all links all posts ever created including the archived ones
	all <-> []Post.collection |>
		sort($, Order::Descending, Post.publication)

	# published links all currently published posts
	published -> []Post = this.all |>
		filter($, ($p) => $p.archived == nil) |>
		sort($, Order::Descending, Post.publication)

	# archived links all archived posts
	archived -> []Post = this.all |>
		filter($, ($p) => $p.archived != nil) |>
		sort($, Order::Descending, Post.publication)

	# trending lists the most relevant posts sorted by the number of
	# reactions
	trending -> []Post =
		sort(this.published, Order::Descending, Post.reactions.all:length)
}
