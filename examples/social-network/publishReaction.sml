model SocialNetwork

# PublishReaction publishes a new reaction
transact PublishReaction(
	target  *Post | *Reaction
	author  *User
	type    ReactionType
	comment ?Text
) {
	publishedReaction Reaction
}

access PublishReaction {
	User {
		# The user is the author of the reaction
		*accessor == *author
	}
}
