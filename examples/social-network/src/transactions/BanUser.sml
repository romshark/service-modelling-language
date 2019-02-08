# BanUser temporarily disables a user's profile
transaction BanUser::SocialNetwork

parameters {
	$admin ID<Admin>
	$user  ID<User>
}

results {
	bannedUser User
}

access BanUser {
	allow Admin as $accessor if $accessor.rights.banUsers
}
