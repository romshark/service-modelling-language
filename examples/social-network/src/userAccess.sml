model SocialNetwork

# Basic user profile access permissions
access User as accessed {
	allow Admin
	allow User as accessor {
		accessed.access.profile {
		Visibility:
			# The profile is public
			if accessed.access.profile == Public
			
			# The profile is accessible to all friends by default and the user
			# is a friend
			if accessor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in accessed.access.profile

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in accessed.access.profile
		}
	}
}

# All post nodes except the published and trending ones are only accessible to
# their owner
access User.posts as accessed {
	allow Admin
	allow User as accessor {
		if accessor == accessed
	}
}

access User.posts.published {
	allow public
}

access User.posts.trending {
	allow public
}

# User email address access permissions
access User.email as accessed {
	allow Admin
	allow User as accessor {
		accessed.access.email {
		Visibility:
			# The email is public
			if accessed.access.email == Public
			
			# The email address is visible to friends only and the user is a
			# friend
			if accessed.access.email == Friends && accessor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in accessed.access.email

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in accessed.access.email
		}
	}
}

# User email phone number permissions
access User.phone as accessed {
	allow Admin
	allow User as accessor {
		accessed.access.phone {
		Visibility:
			# The phone number is public
			if accessed.access.phone == Public
			
			# The phone number is visible to friends only and the user is a
			# friend
			if accessed.access.phone == Friends && accessor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in accessed.access.phone

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in accessed.access.phone
		}
	}
}

# User birthDate access permissions
access User.birthDate as accessed {
	allow Admin
	allow User as accessor {
		accessed.access.birthDate {
		Visibility:
			# The birthDate is public
			if accessed.access.birthDate == Public
			
			# The birthDate is visible to friends only and the user is a friend
			if accessed.access.birthDate == Friends && accessor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in accessed.access.birthDate

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in accessed.access.birthDate
		}
	}
}


# User friend list access permissions
access User.friends as accessed {
	allow Admin
	allow User as accessor {
		accessed.access.friends {
		Visibility:
			# The friend list is public
			if accessed.access.friends == Public

			# The friend list is visible to friends only and the user is a
			# friend
			if accessed.access.friends == Friends && accessor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in accessed.access.friends

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in accessed.access.friends
		}
	}
}

# Access permissions of the access permission configurations
access User.access as accessed {
	allow Admin
	allow User as accessor {
		# The user is the owner of the profile
		if accessor == accessed
	}
}

# User residence access permissions
access User.residence as accessed {
	allow Admin
	allow User as accessor {
		accessed.access.residence {
		Visibility:
			# The residence is public
			if accessed.access.residence == Public

			# The residence is visible to friends only and the user is a friend
			if accessed.access.residence == residence &&
				accessor in accessed.residence

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in accessed.access.residence

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in accessed.access.residence
		}
	}
}

access User.mutualFriends as accessed {
	allow Admin
	allow User as accessor {
		# The user is the target of the mutual friends search
		accessed.target == accessor && accessed.access.friends {
		Visibility:
			# The friend list is public
			if accessed.access.friends == Public

			# The friend list is visible to friends only and the user is a
			# friend
			if accessed.access.friends == friends &&
				accessor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			if accessor !in accessed.access.friends

		VisibilityWhitelist:
			# The user is in the whitelist
			if accessor in accessed.access.friends
		}
	}
}

# The inbox is accessible only to its owner
access User.inbox as accessed {
	allow User as accessor {
		if accessor == accessed
	}
}

# The outbox is accessible only to its owner
access User.outbox as accessed {
	allow User as accessor {
		if accessor == accessed
	}
}

# The list of managed organization pages is accessible only to its owner
access User.managedOrganizationPages as accessed {
	allow User as accessor {
		if accessor == accessed
	}
}

# The activation time is accessible ony to the profile owner
access User.activation as accessed {
	allow User as accessor {
		if accessor == accessed
	}
}
