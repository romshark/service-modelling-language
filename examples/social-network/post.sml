model SocialNetwork

entity Post {
	publisher   User | Organization
	publication Time
	content     Text
	access      VisibilityPermission
	reactions   Reactions

	# archived specifies the time the post was removed. This field is null when
	# the post was not removed
	archived ?Time
}

relation PostPublisher: []Post <-> User (publisher, posts.all)

relation PostPublisherOrganization:
	[]Post <-> Organization (publisher, posts.all)

# Posts are either public, only accessible to the friends of a user, to a
# whitelist of friends or to all friends except the blacklisted ones
access Post {
	User {
		typeof accessed.access {
		Visibility:
			# The post is public
			accessed.access == Public
			
			# The post is accessible to all friends by default and the user is
			# a friend
			accessed.access == Friends && *accessor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access
		}
	}
}
