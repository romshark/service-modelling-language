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
	employmentHistory []Organization {
		sort desc :relation.begin
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

	posts Posts

	# inbox lists all received messages
	inbox []Message {
		sort desc Message.sent
	}

	# outbox lists all sent messages
	outbox []Message {
		sort desc Message.sent
	}

	# managedOrganizationPages links all organization pages the user administers
	managedOrganizationPages []Organization

	# outgoingFriendshipRequests lists all outgoing friendship requests the user
	# initiated sorted by their age
	outgoingFriendshipRequests []FriendshipRequest {
		sort   asc FriendshipRequest.creation
		filter FriendshipRequest.status == null
	}

	# incomingFriendshipRequests lists all incoming friendship requests the user
	# received sorted by their age
	incomingFriendshipRequests []FriendshipRequest {
		sort   asc FriendshipRequest.creation
		filter FriendshipRequest.status == null
	}

	# banned is null as long as the profile isn't banned
	banned ?Time

	# organizationRatings links all organization ratings posted by this user
	organizationRatings
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
