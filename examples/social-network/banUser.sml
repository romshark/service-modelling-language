model SocialNetwork

# BanUser temporarily disables a user's profile
transact BanUser(
	admin *Admin
	user  *User
) {
	bannedUser User
}

access BanUser {
	Admin {
		accessor.rights.banUsers
	}
}
