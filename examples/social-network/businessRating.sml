model SocialNetwork

entity BusinessRating {
	author   User
	business Business
	rating   ReactionType
	comment  Text
	access   VisiblityPermission
}

relation BusinessUserRating: Business <-> []BusinessRating (ratings, business)
relation BusinessUserRatingUser:
	BusinessRating <-> User (ratings, businessRatings)

access BusinessRating {
	Admin
	User {
		accessed.access.businessRatings {
		Visibility:
			# The businessRatings is public
			accessed.access.businessRatings == Public

			# The businessRatings is visible to friends only and the user is a
			# friend
			accessed.access.businessRatings == businessRatings &&
				*accesor in accessed.businessRatings

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access.businessRatings

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access.businessRatings
		}
	}
}
