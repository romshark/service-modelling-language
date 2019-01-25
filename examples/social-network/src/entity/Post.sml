entity SocialNetwork::Post

properties {
	publisher   <-> Posts.all
	publication Time
	content     Text
	access      VisibilityPermission
	reactions   Reactions

	# archived specifies the time the post was removed. This field is null when
	# the post was not removed
	archived ?Time
}

# Posts are either public, only accessible to the friends of a user, to a
# whitelist of friends or to all friends except the blacklisted ones
access Post {
	allow Admin
	allow User as accessor {
		this.access {
		Visibility:
			# The post is public
			if this.access == Visibility::public
			
			# The post is accessible to all friends by default and the user is
			# a friend
			if this.access == Visibility::friends && accessor in this.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in this.access

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in this.access
		}
	}
}
