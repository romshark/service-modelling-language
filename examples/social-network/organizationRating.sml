model SocialNetwork

entity OrganizationRating {
	author       User
	organization Organization
	rating       ReactionType
	comment      Text
	access       VisiblityPermission
}

relation OrganizationUserRating:
	Organization <-> []OrganizationRating (ratings, organization)

relation OrganizationUserRatingUser:
	OrganizationRating <-> User (ratings, organizationRatings)

access OrganizationRating {
	Admin
	User {
		accessed.access.organizationRatings {
		Visibility:
			# The organizationRatings is public
			accessed.access.organizationRatings == Public

			# The organizationRatings is visible to friends only and the user is
			# a friend
			accessed.access.organizationRatings == organizationRatings &&
				*accesor in accessed.organizationRatings

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access.organizationRatings

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access.organizationRatings
		}
	}
}
