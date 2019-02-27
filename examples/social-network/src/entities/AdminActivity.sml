entity SocialNetwork::AdminActivity

use {
	"std/time" 1.0
}

properties {
	admin Admin
	type  AdminActivityType
	time  Time
}

access AdminActivity {
	allow Admin
}
