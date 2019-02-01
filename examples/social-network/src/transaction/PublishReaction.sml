# PublishReaction publishes a new reaction to either a post or another reaction
transaction SocialNetwork::PublishReaction

arguments {
	$target  ReactionTarget
	$author  ID<User>
	$type    ReactionType
	$comment ?Text
}

results {
	publishedReaction Reaction
}

# Users can only publish reactions on their own behalf
access PublishReaction {
	allow User as accessor {
		# The user is the author of the reaction
		if accessor.activation != nil && accessor == $author
	}
}
