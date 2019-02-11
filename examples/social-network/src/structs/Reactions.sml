# Reactions bundles all reaction related nodes
struct SocialNetwork::Reactions

use {
	"std" 1.0
}

properties {
	# all links all reactions sorted by publication time
	all <-> []Reaction.target |>
		sort($, Order::Descending, Reaction.publication)

	# trendingReactions links the most relevant reactions sorted by the number
	# of sub-reactions
	trendingReactions = this.all |>
		sort($, Order::Descending, Reaction.reactions.all:length)
}
