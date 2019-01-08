model SocialNetwork

struct PersonName {
	firstName Text
	lastName  Text
}

# ProfileAccessPermissions bundles all user profile access permissions
struct ProfileAccessPermissions {
	profile   VisiblityPermission
	email     VisiblityPermission
	phone     VisiblityPermission
	birthDate VisiblityPermission
	residence VisiblityPermission
}

struct Residence {
	country ?Country
	city    ?City
}

# Relative represents a relation between two users (or just a mentioning)
struct Relative {
	type RelativeType

	# relative either represents a user registered in the network or just a name
	# of a person that's not registered on the network
	relative User | PersonName
}

# Relationship represents a relationship between two users (or just a mentioning
# of a relationship)
struct Relationship {
	type    RelationshipType

	# partner either represents a user registered in the network or just a name
	# of a person that's not registered on the network
	partner ?(User | PersonName)
}

struct Employment {
	# employer either links the page of the business or just specifies its name
	employer Business | Text

	# begin specifies the time at which the employment began
	begin Time

	# end is null if the employment is still going
	end ?Time
}

user User {
	// Personal information
	name            PersonName
	gender          Gender
	biography       Text
	avatar          Picture
	email           EmailAddress
	phone           ?PhoneNumber
	birthDate       ?Time
	residence       Residence
	spokenLanguages []Language

	# employmentHistory lists all employment entries sorted by their begin
	employmentHistory []Employment {
		sort desc Employment.begin
	}

	# registration represents the time of the profile creation
	registration Time

	// Connections
	friends      []User
	relatives    []Relative
	relationship Relationship

	# access defines all access permissions
	access ProfileAccessPermissions

	# mutualFriends lists all mutual friends between the user and the given
	# target user
	mutualFriends(target *User) []User

	# publishedPosts lists all posts published by the user sorted by publication
	# time
	publishedPosts []Post {
		sort   desc Post.publication
	}

	# trendingPosts lists the most relevant posts sorted by the number of
	# reactions
	trendingPosts -> publishedPosts {
		sort desc Post.reactions:length
	}

	# inbox lists all received messages
	inbox []Message {
		sort desc Message.sent
	}

	# outbox lists all sent messages
	outbox []Message {
		sort desc Message.sent
	}

	# managedBusinessPages links all business pages the user administers
	managedBusinessPages []Business

	# outgoingFriendshipRequests lists all outgoing friendship requests the user
	# initiated sorted by their age
	outgoingFriendshipRequests []FriendshipRequest {
		sort   asc FriendshipRequest.creation
		filter FriendshipRequest.status != null
	}

	# incomingFriendshipRequests lists all incoming friendship requests the user
	# received sorted by their age
	incomingFriendshipRequests []FriendshipRequest {
		sort   asc FriendshipRequest.creation
		filter FriendshipRequest.status != null
	}

	# banned is null as long as the profile isn't banned
	banned ?Time

	# businessRatings links all business ratings posted by this user
	businessRatings
}

relation UserAddressCountry: User -> Country (residence.country)
relation UserAddressCity: User -> City (residence.city)

relation UserFriends: User <-> []User (friends) {
	# establishment defines the time when the friendship relationship was
	# established
	establishment Time
}

relation UserRelatives: User <-> []User (relatives.relative)

relation UserPartner: User <-> User (relationship.partner) {
	start Time
}

relation UserMutualFriends: User -> []User (mutualFriends)

# Basic user profile access permissions
access User {
	Admin
	User {
		accessed.access.email {
		Visibility:
			# The profile is public
			accessed.access.profile == Public
			
			# The profile is accessible to all friends by default and the user
			# is a friend
			*accessor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access.email

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access.email
		}
	}
}

# User email address access permissions
access User.email {
	Admin
	User {
		accessed.access.email {
		Visibility:
			# The email is public
			accessed.access.email == Public
			
			# The email address is visible to friends only and the user is a
			# friend
			accessed.access.email == Friends && *accesor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access.email

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access.email
		}
	}
}

# User email phone number permissions
access User.phone {
	Admin
	User {
		accessed.access.phone {
		Visibility:
			# The phone number is public
			accessed.access.phone == Public
			
			# The phone number is visible to friends only and the user is a
			# friend
			accessed.access.phone == Friends && *accesor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access.phone

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access.phone
		}
	}
}

# User birthDate access permissions
access User.birthDate {
	Admin
	User {
		accessed.access.birthDate {
		Visibility:
			# The birthDate is public
			accessed.access.birthDate == Public
			
			# The birthDate is visible to friends only and the user is a friend
			accessed.access.birthDate == Friends && *accesor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access.birthDate

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access.birthDate
		}
	}
}


# User friend list access permissions
access User.friends {
	Admin
	User {
		accessed.access.friends {
		Visibility:
			# The friend list is public
			accessed.access.friends == Public

			# The friend list is visible to friends only and the user is a
			# friend
			accessed.access.friends == Friends && *accesor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access.friends

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access.friends
		}
	}
}

# Access permissions of the access permission configurations
access User.access {
	Admin
	User {
		# The user is the owner of the profile
		*accessor == *accessed
	}
}

# User residence access permissions
access User.residence {
	Admin
	User {
		accessed.access.residence {
		Visibility:
			# The residence is public
			accessed.access.residence == Public

			# The residence is visible to friends only and the user is a friend
			accessed.access.residence == residence &&
				*accesor in accessed.residence

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access.residence

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access.residence
		}
	}
}

access User.mutualFriends {
	Admin
	User {
		# The user is the target of the mutual friends search
		*accessed.target == *accessor && accessed.access.friends {
		Visibility:
			# The friend list is public
			accessed.access.friends == Public

			# The friend list is visible to friends only and the user is a
			# friend
			accessed.access.friends == friends &&
				*accesor in accessed.friends

		VisibilityBlacklist:
			# The user is not in the blacklist
			*accessor !in accessed.access.friends

		VisibilityWhitelist:
			# The user is in the whitelist
			*accessor in accessed.access.friends
		}
	}
}

access User.inbox,
	User.outbox,
	User.managedBusinessPages {
	User {
		*accessor == *accessed
	}
}