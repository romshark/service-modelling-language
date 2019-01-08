model SocialNetwork

# PublishReaction publishes a new reaction to either a post or another reaction
transact PublishReaction(
	target  *Post | *Reaction
	author  *User
	type    ReactionType
	comment ?Text
) {
	publishedReaction Reaction
}

# Users can only publish reactions on their own behalf
access PublishReaction {
	User {
		# The user is the author of the reaction
		*accessor == *accessed.author
	}
}
