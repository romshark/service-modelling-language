entity SocialNetwork::OrganizationRating

properties {
	author       <-> User.organizationRatings
	organization <-> Organization.ratings
	rating       ReactionType
	comment      Text
	access       VisiblityPermission
}

access OrganizationRating {
	allow Admin
	allow User as accessor {
		this.access.organizationRatings {
		Visibility:
			# The organizationRatings is public
			if this.access.organizationRatings == Visibility::public

			# The organizationRatings is visible to friends only and the user is
			# a friend
			if this.access.organizationRatings == Visibility::friends &&
				accessor in this.organizationRatings

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in this.access.organizationRatings

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in this.access.organizationRatings
		}
	}
}
