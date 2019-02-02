entity SocialNetwork::AdminActivity

properties {
	admin <-> Admin.activities
	type  AdminActivityType
	time  Time
}

access AdminActivity {
	allow Admin
}
