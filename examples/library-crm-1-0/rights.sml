model LibraryCRM

# ViewModifyDelete represents a view-modify-delete permission set
struct ViewModifyDelete {
	view   Bool
	modify Bool
	delete Bool
}

// Define the set of rights of a manager user
# ManagerRights defines the explicit rights of a manager
struct ManagerRights {
	# manageManagerProfiles determines whether the manager is allowed to manage
	# the profiles of other managers
	manageManagerProfiles Bool

	# register determines the rights to manage (register, deregister and
	# update) authors, books and book copies
	register ViewModifyDelete // Using a struct as a right

	# readCustomers determines the rights to read either specific customer
	# profiles or all customer profiles. If readCustomers is a list of
	# identifiers then the manager has access to those only
	readCustomers []*Customer | Bool

	# banCustomers determines the right to ban customer profiles
	banCustomers Bool
}

# CustomerRights defines the explicit rights of a customer
struct CustomerRights {
	# borrowBooks determines the right to borrow books
	borrowBooks Bool

	# postBookReviews determines the right to post book reviews
	postBookReviews Bool
}
