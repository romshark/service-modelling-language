model SocialNetwork

# ReactionType represents the type of a reaction
enum ReactionType {
	Happy
	Confused
	Sad
	Angry
}

# Reaction represents a reaction to either a post or another reaction
entity Reaction {
	# target represents the target of the reaction which may be a post or just
	# another reaction
	target <-> Reactions.all
	author <-> User.reactions
	type   ReactionType

	# publication specifies the time the reaction was published
	publication Time

	# comment is optional
	comment ?Text

	# reactions links the reactions to this reaction
	reactions Reactions
}
