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

/* Blacklist & Whitelist Relations */

relation ProfileVisibilityBlacklist:
	User -> []User (access.profile.<VisibilityBlacklist>.users)
relation ProfileVisibilityWhitelist:
	User -> []User (access.profile.<VisibilityWhitelist>.users)

relation EmailVisibilityBlacklist:
	User -> []User (access.email.<VisibilityBlacklist>.users)
relation EmailVisibilityWhitelist:
	User -> []User (access.email.<VisibilityWhitelist>.users)

relation UserPhoneVisibilityBlacklist:
	User -> []User (access.phone.<VisibilityBlacklist>.users)
relation UserPhoneVisibilityWhitelist:
	User -> []User (access.phone.<VisibilityWhitelist>.users)

relation UserBirthDateVisibilityBlacklist:
	User -> []User (access.birthDate.<VisibilityBlacklist>.users)
relation UserBirthDateVisibilityWhitelist:
	User -> []User (access.birthDate.<VisibilityWhitelist>.users)

relation UserResidenceVisibilityBlacklist:
	User -> []User (access.residence.<VisibilityBlacklist>.users)
relation UserResidenceVisibilityWhitelist:
	User -> []User (access.residence.<VisibilityWhitelist>.users)
