use {
	"std" 1.0
}

# PublishReaction publishes a new reaction to either a post or another reaction
transaction socialNetwork::PublishReaction (
	$target  ReactionTarget,
	$author  ID<User>,
	$type    ReactionType,
	$comment ?socialNetwork::Text,
)

-> (Error or Reaction) => {
	// TODO
}

# Users can only publish reactions on their own behalf
access PublishReaction {
	allow User as $accessor if $accessor.activation != nil and
		$accessor == $author
}
