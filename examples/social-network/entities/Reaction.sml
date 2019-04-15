use {
	"std"      1.0
	"std/time" 1.0
}

# Reaction represents a reaction to either a post or another reaction
entity socialNetwork::Reaction {
	# target represents the target of the reaction which may be a post or just
	# another reaction
	target ReactionTarget
	author User
	type   ReactionType

	# publication specifies the time the reaction was published
	publication Time

	# comment is optional
	comment ?socialNetwork::Text

	# reactions links the reactions to this reaction
	reactions reactions(this)
}
