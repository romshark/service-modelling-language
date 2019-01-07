model SocialNetwork

# ReactionType represents the type of a reaction
enum ReactionType {
	Happy
	Confused
	Sad
	Angry
}

# Reaction represents a comment to a post
entity Reaction {
	# target represents the target of the reaction which may be a post or just
	# another reaction
	target      Post | Reaction
	author      User
	type        ReactionType
	comment     ?Text
	publication Time

	# reactions lists all reactions to this reaction
	reactions Reaction
}

relation PostReaction: Post <-> []Reaction (reactions, target)
relation ReactionReaction: Reaction <-> []Reaction (reactions, target)
