use {
	"std"      1.0
	"std/time" 1.0
}

user socialNetwork::User {
	// Personal information
	name            PersonName
	gender          Gender
	biography       ?Text
	avatar          ?Picture
	email           EmailAddress
	phone           ?PhoneNumber
	birthDate       ?Time
	residence       ?City
	spokenLanguages SpokenLanguages

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
		predicate: ($fr) => $fr.from == this and $fr.status == nil
		order:     Order::asc
		orderBy:   FriendshipRequest.creation
	}

	# incomingFriendshipRequests lists all incoming friendship requests the user
	# received sorted by their age
	incomingFriendshipRequests Collection<FriendshipRequest> {
		predicate: ($fr) => $fr.to == this and $fr.status == nil
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

# Basic user profile access permissions
access {
	allow Admin

	# A user is allowed to access the profile if the profile is public and
	# the user is a friend. If the profile is black-list protected then the user
	# is only allowed to access if not listed in the black-list, otherwise if
	# the profile is white-list protected then the user is only allowed to
	# access if listed in the white-list
	allow User as $accessor if $accessor == this or
		this.access.profile as $v {
			Visibility = $v == Visibility::public or $accessor in this.friends
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

access posts.all {
	allow User as $accessor if $accessor == this
}

# Archived posts are only accessible to administrators
access posts.archived {
	allow Admin
}

# User email address access permissions
access email {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.email as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

# User phone number permissions
access phone {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.phone as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

# User birthDate access permissions
access birthDate {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.birthDate as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}


# User friend list access permissions
access friends {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.friends as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

# Access permissions of the access permission configurations
access access {
	allow Admin

	# Only the profile owner is allowed to access the profile's access
	# permission configurations
	allow User as $accessor if $accessor == this
}

# User residence access permissions
access residence {
	allow Admin
	allow User as $accessor if $accessor == this or
		this.access.residence as $v {
			Visibility = match $v {
				Visibility::public  = true
				Visibility::friends = $accessor in this.friends
			}
			VisibilityBlacklist = $accessor !in $v
			VisibilityWhitelist = $accessor in $v
		}
}

# The inbox is accessible only to its owner
access inbox {
	allow User as $accessor if $accessor == this
}

# The outbox is accessible only to its owner
access outbox {
	allow User as $accessor if $accessor == this
}

# The list of managed organization pages is accessible only to its owner
access managedOrganizationPages {
	allow User as $accessor if $accessor == this
}

# The activation time is accessible ony to the profile owner
access activation {
	allow User as $accessor if $accessor == this
}
