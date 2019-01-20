model SocialNetwork

entity OrganizationRating {
	author       <-> User.organizationRatings
	organization <-> Organization.ratings
	rating       ReactionType
	comment      Text
	access       VisiblityPermission
}

access OrganizationRating as accessed {
	allow Admin
	allow User as accessor {
		accessed.access.organizationRatings {
		Visibility:
			# The organizationRatings is public
			if accessed.access.organizationRatings == Public

			# The organizationRatings is visible to friends only and the user is
			# a friend
			if accessed.access.organizationRatings == organizationRatings &&
				accessor in accessed.organizationRatings

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in accessed.access.organizationRatings

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in accessed.access.organizationRatings
		}
	}
}
