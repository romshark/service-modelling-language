# PublishReaction publishes a new reaction to either a post or another reaction
transaction SocialNetwork::PublishReaction

parameters {
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
	allow User as $accessor if $accessor.activation != nil &&
		$accessor == $author
}
