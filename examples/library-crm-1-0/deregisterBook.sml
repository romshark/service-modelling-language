model LibraryCRM

# deregisterBook removes the given [book] from the register
transact deregisterBook(book *Book)

errors deregisterBook {
	# ErrCopiesRemaining is thrown when there are copies of the book still
	# registered in the system
	ErrCopiesRemaining
}

access deregisterBook {
	Manager.register modify
}
