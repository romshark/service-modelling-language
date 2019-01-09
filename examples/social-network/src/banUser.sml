model SocialNetwork

# BanUser temporarily disables a user's profile
transact BanUser(
	admin *Admin
	user  *User
) {
	bannedUser User
}

access BanUser {
	allow Admin as accessor {
		if accessor.rights.banUsers
	}
}
