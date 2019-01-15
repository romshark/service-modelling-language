model SocialNetwork

struct PersonName {
	firstName Text
	lastName  Text
}

# Relative represents a relation between two users or just a relative's name
struct Relative {
	type RelativeType

	# relative either represents a user registered in the network or just a name
	# of a person that's not registered on the network
	relative PersonName | <-> Relative.relative
}

# Relationship represents a relationship between two users or just a name of the
# partner
struct Relationship {
	type    RelationshipType

	# partner either represents a user registered in the network or just a name
	# of a person that's not registered on the network
	partner ?(PersonName | <-> Relationship.partner)
}

user User {
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

	# mutualFriends lists all mutual friends between the user and the given
	# target user
	mutualFriends(target *User) -> friends as friends {
		filter intersection(target.friends, friends)
	}

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
