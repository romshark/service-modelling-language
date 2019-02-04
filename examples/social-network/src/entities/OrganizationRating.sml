entity SocialNetwork::OrganizationRating

properties {
	author       <-> User.organizationRatings
	organization <-> Organization.ratings
	rating       ReactionType
	comment      Text
	access       VisiblityPermission
}

access {
	allow Admin
	allow User as $accessor if $accessor == this.author ||
		select (typeof this.access) as $v {
			case Visibility = select $v {
				case Visibility::public  = true
				case Visibility::friends = $accessor in this.author.friends
			}
			case VisibilityBlacklist = $accessor !in $v
			case VisibilityWhitelist = $accessor in $v
		}
}
