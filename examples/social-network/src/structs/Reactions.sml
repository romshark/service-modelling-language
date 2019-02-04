# Reactions bundles all reaction related nodes
struct SocialNetwork::Reactions

properties {
	# all links all reactions sorted by publication time
	all <-> []Reaction.target |>
		sort $ desc Reaction.publication

	# trendingReactions links the most relevant reactions sorted by the number
	# of sub-reactions
	trendingReactions = this.all |>
		sort $ desc Reaction.reactions.all:length
}
