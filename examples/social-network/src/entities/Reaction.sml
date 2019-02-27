# Reaction represents a reaction to either a post or another reaction
entity SocialNetwork::Reaction

use {
	"std" 1.0
}

properties {
	# target represents the target of the reaction which may be a post or just
	# another reaction
	target (Post or Reaction)
	author User
	type   ReactionType

	# publication specifies the time the reaction was published
	publication Time

	# comment is optional
	comment ?Text

	# reactions links the reactions to this reaction
	reactions Reactions {
		source: this
	}
}
