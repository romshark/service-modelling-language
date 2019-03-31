# PublishReaction publishes a new reaction to either a post or another reaction
transaction socialNetwork::PublishReaction

use {
	"std" 1.0
}

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
	allow User as $accessor if $accessor.activation != nil and
		$accessor == $author
}
