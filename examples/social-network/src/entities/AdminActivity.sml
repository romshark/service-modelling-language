entity SocialNetwork::AdminActivity

use {
	"std" 1.0
}

properties {
	admin Admin
	type  AdminActivityType
	time  Time
}

access AdminActivity {
	allow Admin
}
