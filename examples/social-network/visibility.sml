model SocialNetwork

enum Visibility {
	Private
	Friends
	Public
}

struct VisibilityBlacklist {
	users []User
}

struct VisibilityWhitelist {
	users []User
}

union VisibilityPermission {
	Visibility
	VisibilityBlacklist
	VisibilityWhitelist
}
