model LibraryCRM

# deregisterBookCopy removes a book [copy] from the register
transact deregisterBookCopy(copy *BookCopy)

errors deregisterBookCopy {
	# ErrBorrowed is returned when the given book copy is currently borrowed
	ErrBorrowed
}

access deregisterBookCopy {
	Manager {
		register.delete
	}
}
