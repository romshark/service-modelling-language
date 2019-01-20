model SocialNetwork

# BanUser temporarily disables a user's profile
transact BanUser(
	admin ID<Admin>
	user  ID<User>
) {
	bannedUser User
}

access BanUser {
	allow Admin as accessor {
		if accessor.rights.banUsers
	}
}
