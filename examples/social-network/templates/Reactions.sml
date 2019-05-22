use {
	"std" 1.0
}

# reactions bundles all reaction related nodes
template socialNetwork::reactions (
	*source (Post or Reaction)
) = graph {
	# all links all reactions sorted by publication time
	all collection<Reaction>(
		($r) => $r.target == *source,
		Order::desc,
		Reaction.publication,
	)

	# trending links the most relevant reactions sorted by the number
	# of sub-reactions
	trending collection<Reaction>(
		($r) => $r.target == *source,
		Order::desc,
		Reaction.reactions.all:length,
	)
}
