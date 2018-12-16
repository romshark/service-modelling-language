model LibraryCRM

// Define a role based on the rights of a manager user.
// A role is just a preset of rights
role PrimaryAdmin for Manager {
	register  view | modify | delete
	customers view | modify | delete
}

// Define a secondary administrator role only allowed to view customers
role SecondaryAdmin for Manager {
	register  view | modify | delete
	customers view
}
