model SocialNetwork

# Reactions bundles all reaction related nodes
struct Reactions {
	# all links all reactions sorted by publication time
	all <-> []Reaction.target as reactions {
		sort desc reactions.publication
	}

	# trendingReactions links the most relevant reactions sorted by the number
	# of sub-reactions
	trendingReactions -> all as reactions {
		sort desc reactions.reactions.all:length
	}
}
