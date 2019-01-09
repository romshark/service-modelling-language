model SocialNetwork

relation UserAddressCountry: User -> Country (residence.country)
relation UserAddressCity: User -> City (residence.city)

relation UserFriends: User <-> []User (friends) {
	# establishment defines the time when the friendship relationship was
	# established
	establishment Time
}

relation UserRelatives: User <-> []User (relatives.relative<User>)

relation UserPartner: User <-> User (relationship.partner<User>) {
	start Time
}

relation UserMutualFriends: User -> []User (mutualFriends)
