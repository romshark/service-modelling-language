# BanUser temporarily disables a user's profile
transaction BanUser::SocialNetwork (
	$admin ID<Admin>,
	$user  ID<User>,
)

-> User = {
	// TODO
}

access BanUser {
	allow Admin as $accessor if $accessor.rights.banUsers
}
