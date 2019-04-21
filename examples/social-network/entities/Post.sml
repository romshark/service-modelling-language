use {
	"std"      1.0
	"std/time" 1.0
}

entity socialNetwork::Post {
	publisher   (User or Organization)
	publication Time
	content     socialNetwork::Text
	access      VisibilityPermission

	reactions reactions(this)

	# archived specifies the time the post was removed. This field is nil when
	# the post was not removed
	archived ?Time
}

# Posts are either public, only accessible to the friends of a user, to a
# whitelist of friends or to all friends except the blacklisted ones
access {
	allow Admin
	allow User as $accessor if this.publisher as $publisher {
		User then $accessor == $publisher
		Organization then true
		else false
	} or this.access as $access {
		Visibility then match $access {
			Visibility::public then true
			Visibility::friends then $accessor in this.friends
		}
		VisibilityBlacklist then $accessor !in $access
		VisibilityWhitelist then $accessor in $access
	}
}
