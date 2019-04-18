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
			Visibility then match $v {
				Visibility::public then true
				Visibility::friends then $accessor in this.author.friends
			}
			VisibilityBlacklist then $accessor !in $v
			VisibilityWhitelist then $accessor in $v
		}
}
