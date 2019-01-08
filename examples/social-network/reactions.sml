model SocialNetwork

# Reactions bundles all reaction related nodes
struct Reactions {
	# all links all reactions sorted by publication time
	all []Reaction {
		sort desc Reaction.publication
	}

	# trendingReactions links the most relevant reactions sorted by the number
	# of sub-reactions
	trendingReactions -> reactions {
		sort desc Reaction.reactions:length
	}
}
