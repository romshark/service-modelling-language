use {
	"std"      1.0
	"std/time" 1.0
}

entity socialNetwork::OrganizationRating {
	author       User
	organization Organization
	rating       ReactionType
	comment      socialNetwork::Text
	access       VisiblityPermission
	publication  Time
}

access {
	allow Admin
	allow User as $accessor if $accessor == this.author or
		this.access as $v {
			Visibility = match $v {
				Visibility::public = true
				Visibility::friends = $accessor in this.author.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}
