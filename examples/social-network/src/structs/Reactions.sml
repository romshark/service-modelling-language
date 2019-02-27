# Reactions bundles all reaction related nodes
struct SocialNetwork::Reactions

use {
	"std" 1.0
}

attributes {
	*source (Post or Reaction)
}

properties {
	# all links all reactions sorted by publication time
	all Collection<Reaction> {
		predicate: ($r) => $r.target == *source
		order:     Order::desc
		orderBy:   Reaction.publication
	}

	# trending links the most relevant reactions sorted by the number
	# of sub-reactions
	trending Collection<Reaction> {
		predicate: ($r) => $r.target == *source
		order:     Order::desc
		orderBy:   Reaction.reactions.all:length
	}
}
