model SocialNetwork

entity Post {
	publisher   User | Business
	publication Time
	content     Text
	access      VisibilityPermission

	# reactions lists all reactions sorted by publication time
	reactions []Reaction {
		sort desc Reaction.publication
	}

	# trendingReactions lists the most relevant reactions sorted by the number
	# of sub-reactions
	trendingReactions -> reactions {
		sort desc Reaction.reactions:length
	}

	# archived specifies the time the post was removed. This field is null when
	# the post was not removed
	archived ?Time
}

relation PostPublisher: []Post <-> User (publisher, posts.all)
relation PostPublisherBusiness: []Post <-> Business (publisher, posts.all)

# Post access permissions
access Post {
	User {
		typeof accessed.access {
		Visibility:
			# The post is public
			accessed.access == Public
			
			# The post is accessible to all friends by default and the user is
			# a friend
			*accessor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access
		}
	}
}
