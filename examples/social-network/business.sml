model SocialNetwork

# Business represents a profile of a business
entity Business {
	name         Text
	registration Time
	ratings      []BusinessRating
	posts        []Post

	# pageAdmins lists all page administrators
	pageAdmins   []User
}

relation BusinessPageAdmins:
	[]Business <-> []User (pageAdmins, managedBusinessPages)

access Business public

access Business.pageAdmins {
	Admin
	User {
		*accessor in accessed.pageAdmins
	}
}
