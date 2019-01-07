model SocialNetwork

enum AdminActivityType {
	BannedUser
}

entity AdminActivity {
	admin Admin
	type  AdminActivityType
	time  Time
}

relation AdminActivities: AdminActivity <-> Admin (admin, activities)
