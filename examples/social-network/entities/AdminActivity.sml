use {
	"std/time" 1.0
}

entity socialNetwork::AdminActivity {
	admin Admin
	type  AdminActivityType
	time  Time
}

access {
	allow Admin
}
