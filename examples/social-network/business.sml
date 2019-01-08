model SocialNetwork

# Business represents a profile of a business
entity Business {
	name         Text
	registration Time
	ratings      []BusinessRating
	posts        Posts

	# pageAdmins lists all page administrators
	pageAdmins []User
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

# Archived posts must only be accessible to business page administrators
access Business.posts.all, Business.posts.archived {
	Admin
	User {
		*accessor in accessed.pageAdmins
	}
}
