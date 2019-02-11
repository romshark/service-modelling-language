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
	residence       ? -> City
	spokenLanguages []Language

	# employmentHistory lists all employments sorted by their begin
	employmentHistory <-> []Employment.user |>
		sort($, Order::Descending, Employment.begin)

	# registration represents the time of the profile creation
	registration Time

	// Connections
	friendships  <-> []Friendship.users
	relatives    []Relative
	relationship Relationship

	friends -> []User =
		map(this.friendships, ($friendship) =>
			filterMap($friendship.users, ($user) => select {
				case ($user != this) = $user
			})
		)

	# access defines all access permissions
	access ProfileAccessPermissions

	posts Posts

	# inbox lists all received messages
	inbox <-> []Message.receiver |>
		sort($, Order::Descending, Message.sent)

	# outbox lists all sent messages
	outbox <-> []Message.sender |>
		sort($, Order::Descending, Message.sent)

	# managedOrganizationPages links all organization pages the user administers
	managedOrganizationPages <-> []Organization.pageAdmins

	# outgoingFriendshipRequests lists all outgoing friendship requests the user
	# initiated sorted by their age
	outgoingFriendshipRequests <-> []FriendshipRequest.from |>
		filter($, ($fr) => $fr.status == nil) |>
		sort($, Order::Ascending, FriendshipRequest.creation)

	# incomingFriendshipRequests lists all incoming friendship requests the user
	# received sorted by their age
	incomingFriendshipRequests <-> []FriendshipRequest.to |>
		filter($, ($fr) => $fr.status == nil) |>
		sort($, Order::Ascending, FriendshipRequest.creation)

	# banned is nil as long as the profile isn't banned
	banned ?Time

	# activation represents the time of account activation. When activation
	# is nil the account must be considered yet not activated.
	activation ?Time

	# organizationRatings links all organization ratings posted by this user
	organizationRatings <-> []OrganizationRating.author

	# reactions links all reactions posted by this user
	reactions <-> []Reaction.author |>
		sort($, Order::Descending, Reaction.publication)
}
