user SocialNetwork::User

use {
	"std" 1.0
}

properties {
	// Personal information
	name            PersonName
	gender          Gender
	biography       Text
	avatar          ?Picture
	email           EmailAddress
	phone           ?PhoneNumber
	birthDate       ?Time
	residence       ?City
	spokenLanguages Array<Language>

	# employmentHistory lists all employments sorted by their begin
	employmentHistory Collection<Employment> {
		predicate: ($e) => $e.user == this
		order:     Order::desc
		orderBy:   Employment.begin
	}

	# registration represents the time of the profile creation
	registration Time

	// Connections
	friendships  Collection<Friendship>
	relatives    Array<Relative>
	relationship Relationship

	friends ReducedCollection<Friendship, User> {
		predicate: ($f) => this in $f.users
		reducer:   ($f) => filter($f.users, ($u) => $u != this)[0]
	}

	# access defines all access permissions
	access ProfileAccessPermissions

	posts Posts {
		publisher: this
	}

	# inbox lists all received messages
	inbox Collection<Message> {
		predicate: ($m) => $m.receiver == this
		order:     Order::desc
		orderBy:   Message.sent
	}

	# outbox lists all sent messages
	outbox Collection<Message> {
		predicate: ($m) => $m.sender == this
		order:     Order::desc
		orderBy:   Message.sent
	}

	# managedOrganizationPages links all organization pages the user administers
	managedOrganizationPages Collection<Organization> {
		predicate: ($o) => this in $o.pageAdmins
	}

	# outgoingFriendshipRequests lists all outgoing friendship requests the user
	# initiated sorted by their age
	outgoingFriendshipRequests Collection<FriendshipRequest> {
		predicate: ($fr) => $fr.from == this && $fr.status == nil
		order:     Order::asc
		orderBy:   FriendshipRequest.creation
	}

	# incomingFriendshipRequests lists all incoming friendship requests the user
	# received sorted by their age
	incomingFriendshipRequests Collection<FriendshipRequest> {
		predicate: ($fr) => $fr.to == this && $fr.status == nil
		order:     Order::asc
		orderBy:   FriendshipRequest.creation
	}

	# banned is nil as long as the profile isn't banned
	banned ?Time

	# activation represents the time of account activation. When activation
	# is nil the account must be considered yet not activated.
	activation ?Time

	# organizationRatings links all organization ratings posted by this user
	organizationRatings Collection<OrganizationRating> {
		predicate: ($or) => $or.author == this
		order:     Order::desc
		orderBy:   OrganizationRating.publication
	}

	# reactions links all reactions posted by this user
	reactions Collection<Reaction> {
		predicate: ($r) => $r.author == this
		order:     Order::desc
		orderBy:   Reaction.publication
	}
}
