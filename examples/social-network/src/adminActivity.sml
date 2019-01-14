model SocialNetwork

enum AdminActivityType {
	BannedUser
}

entity AdminActivity {
	admin <-> Admin.activities
	type  AdminActivityType
	time  Time
}

access AdminActivity {
	allow Admin
}
