model LibraryCRM

right Allowance {
	allowed
	forbidden
}

// Define a read-write-delete style right
right ViewModifyDelete {
	view   // Allows reading only
	modify // Allow writing
	delete // Allows deleting
}

// Define the set of rights of a manager user
rights Manager {
	# register allows an administrator to manage (register, deregister and
	# update) authors, books and book copies
	register ViewModifyDelete

	# customers allows an administrator to read the profiles of all
	# registered customers while manageCustomers allows to update and ban them
	customers ViewModifyDelete
}

rights Customer {
	# borrowBooks allows a customer to borrow books
	borrowBooks Allowance

	# postBookReviews allows a customer posting book reviews
	postBookReviews Allowance
}