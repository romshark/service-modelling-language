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
	employmentHistory <-> []Organization.employees |> Employment.begin

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
	inbox <-> []Message.receiver |> sort desc Message.sent

	# outbox lists all sent messages
	outbox <-> []Message.sender |> sort desc Message.sent

	# managedOrganizationPages links all organization pages the user administers
	managedOrganizationPages <-> []Organization.pageAdmins

	# outgoingFriendshipRequests lists all outgoing friendship requests the user
	# initiated sorted by their age
	outgoingFriendshipRequests <-> []FriendshipRequest.from |>
		sort   asc outFriendReq.creation |>
		filter outFriendReq.status == null

	# incomingFriendshipRequests lists all incoming friendship requests the user
	# received sorted by their age
	incomingFriendshipRequests <-> []FriendshipRequest.to |>
		sort   asc inFriendReq.creation |>
		filter inFriendReq.status == null

	# banned is null as long as the profile isn't banned
	banned ?Time

	# activation represents the time of account activation. When activation
	# is null the account must be considered yet not activated.
	activation ?Time

	# organizationRatings links all organization ratings posted by this user
	organizationRatings <-> []OrganizationRating.author

	# reactions links all reactions posted by this user
	reactions <-> []Reaction.author |> sort desc Reaction.publication
}
