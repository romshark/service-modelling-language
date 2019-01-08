model SocialNetwork

entity Post {
	author      User | Business
	publication ?Time
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
}

relation PostAuthor: []Post <-> User (author, posts)
relation PostAuthorBusiness: []Post <-> Business (author, posts)

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
