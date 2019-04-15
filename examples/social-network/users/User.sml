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
	employmentHistory collection<Employment>(
		($e) => $e.user == this,
		Order::desc,
		Employment.begin,
	)

	# registration represents the time of the profile creation
	registration Time

	// Connections
	friendships  collection<Friendship>(nil, nil, nil)
	relatives    Array<Relative>
	relationship Relationship

	friends reducedCollection<Friendship, User>(
		($f) => this in $f.users,
		nil,
		nil,
		($f) => filter($f.users, ($u) => $u != this)[0],
	)

	# access defines all access permissions
	access ProfileAccessPermissions

	posts posts(this)

	# inbox lists all received messages
	inbox collection<Message>(
		($m) => $m.receiver == this,
		Order::desc,
		Message.sent,
	)

	# outbox lists all sent messages
	outbox collection<Message>(
		($m) => $m.sender == this,
		Order::desc,
		Message.sent,
	)

	# managedOrganizationPages links all organization pages the user administers
	managedOrganizationPages collection<Organization>(
		($o) => this in $o.pageAdmins,
		nil,
		nil,
	)

	# outgoingFriendshipRequests lists all outgoing friendship requests the user
	# initiated sorted by their age
	outgoingFriendshipRequests collection<FriendshipRequest>(
		($fr) => $fr.from == this and $fr.status == nil,
		Order::asc,
		FriendshipRequest.creation,
	)

	# incomingFriendshipRequests lists all incoming friendship requests the user
	# received sorted by their age
	incomingFriendshipRequests collection<FriendshipRequest>(
		($fr) => $fr.to == this and $fr.status == nil,
		Order::asc,
		FriendshipRequest.creation,
	)

	# banned is nil as long as the profile isn't banned
	banned ?Time

	# activation represents the time of account activation. When activation
	# is nil the account must be considered yet not activated.
	activation ?Time

	# organizationRatings links all organization ratings posted by this user
	organizationRatings collection<OrganizationRating>(
		($or) => $or.author == this,
		Order::desc,
		OrganizationRating.publication,
	)

	# reactions links all reactions posted by this user
	reactions collection<Reaction>(
		($r) => $r.author == this,
		Order::desc,
		Reaction.publication,
	)
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
