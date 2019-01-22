user SocialNetwork::User

properties {
	// Personal information
	name            PersonName
	gender          Gender
	biography       Text
	avatar          ?Picture
	email           EmailAddress
	phone           ?PhoneNumber
	birthDate       ?Time
	residence       ? -> City
	spokenLanguages []Language

	# employmentHistory lists all employment entries sorted by their begin
	employmentHistory <-> []Organization.employees as organizations {
		sort desc organizations:relation.begin
	}

	# registration represents the time of the profile creation
	registration Time

	// Connections
	friends      <-> []User.friends
	relatives    []Relative
	relationship Relationship

	# access defines all access permissions
	access ProfileAccessPermissions

	posts Posts

	# inbox lists all received messages
	inbox <-> []Message.receiver as messages {
		sort desc messages.sent
	}

	# outbox lists all sent messages
	outbox <-> []Message.sender as messages {
		sort desc messages.sent
	}

	# managedOrganizationPages links all organization pages the user administers
	managedOrganizationPages <-> []Organization.pageAdmins

	# outgoingFriendshipRequests lists all outgoing friendship requests the user
	# initiated sorted by their age
	outgoingFriendshipRequests <-> []FriendshipRequest.from as outFriendReq {
		sort   asc outFriendReq.creation
		filter outFriendReq.status == null
	}

	# incomingFriendshipRequests lists all incoming friendship requests the user
	# received sorted by their age
	incomingFriendshipRequests <-> []FriendshipRequest.to as inFriendReq {
		sort   asc inFriendReq.creation
		filter inFriendReq.status == null
	}

	# banned is null as long as the profile isn't banned
	banned ?Time

	# activation represents the time of account activation. When activation
	# is null the account must be considered yet not activated.
	activation ?Time

	# organizationRatings links all organization ratings posted by this user
	organizationRatings <-> []OrganizationRating.author

	# reactions links all reactions posted by this user
	reactions <-> []Reaction.author as reactions {
		sort desc reactions.publication
	}
}

# Basic user profile access permissions
access User {
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
access posts from User as accessed {
	allow Admin
	allow User as accessor {
		if accessor == accessed
	}
}

access posts.published {
	allow public
}

access posts.trending {
	allow public
}

# User email address access permissions
access email from User as accessed {
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
access phone from User as accessed {
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
access birthDate from User as accessed {
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
access friends from User as accessed {
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
access access from User as accessed {
	allow Admin
	allow User as accessor {
		# The user is the owner of the profile
		if accessor == accessed
	}
}

# User residence access permissions
access residence from User as accessed {
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

access mutualFriends from User as accessed {
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
access inbox from User as accessed {
	allow User as accessor {
		if accessor == accessed
	}
}

# The outbox is accessible only to its owner
access outbox from User as accessed {
	allow User as accessor {
		if accessor == accessed
	}
}

# The list of managed organization pages is accessible only to its owner
access managedOrganizationPages from User as accessed {
	allow User as accessor {
		if accessor == accessed
	}
}

# The activation time is accessible ony to the profile owner
access activation from User as accessed {
	allow User as accessor {
		if accessor == accessed
	}
}
