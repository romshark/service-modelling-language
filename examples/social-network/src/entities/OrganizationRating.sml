entity SocialNetwork::OrganizationRating

use {
	"std"      1.0
	"std/time" 1.0
}

properties {
	author       User
	organization Organization
	rating       ReactionType
	comment      Text
	access       VisiblityPermission
	publication  Time
}

access {
	allow Admin
	allow User as $accessor if $accessor == this.author or
		select typeof(this.access) as $v {
			case Visibility = select $v {
				case Visibility::public  = true
				case Visibility::friends = $accessor in this.author.friends
			}
			case VisibilityBlacklist = $accessor !in $v
			case VisibilityWhitelist = $accessor in $v
		}
}
