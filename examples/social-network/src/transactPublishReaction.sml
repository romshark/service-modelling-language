model SocialNetwork

# PublishReaction publishes a new reaction to either a post or another reaction
transact PublishReaction(
	target  ID<Post> | ID<Reaction>
	author  ID<User>
	type    ReactionType
	comment ?Text
) {
	publishedReaction Reaction
}

# Users can only publish reactions on their own behalf
access PublishReaction as accessed {
	allow User as accessor {
		# The user is the author of the reaction
		if accessor.activation != null && accessor == accessed.author
	}
}
