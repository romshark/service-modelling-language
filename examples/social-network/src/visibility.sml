model SocialNetwork

enum Visibility {
	Private
	Friends
	Public
}

struct VisibilityBlacklist {
	users -> []User
}

struct VisibilityWhitelist {
	users -> []User
}

union VisibilityPermission {
	Visibility
	VisibilityBlacklist
	VisibilityWhitelist
}

# VisibilityBlacklistForm is the pure version of VisibilityBlacklist used as an
# input form
struct VisibilityBlacklistForm {
	users []ID<User>
}

# VisibilityWhitelistForm is the pure version of VisibilityBlacklist used as an
# input form
struct VisibilityWhitelistForm {
	users []ID<User>
}

# VisibilityPermissionForm is used as an input form
union VisibilityPermissionForm {
	Visibility
	VisibilityBlacklistForm
	VisibilityWhitelistForm
}
