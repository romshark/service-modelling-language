model LibraryCRM

use Std 1.0

# registerBook adds a new book to the register
transact registerBook(
	title       Text
	description ?Text
	tags        []?Text
	isbn        String
    authors     []*Author
    publication ?Time
	statistics  ?BookStatistics
) {
	registered Book
}

errors registerBook {
	# ErrDuplicateIsbn is thrown when the given ISBN is already registered
	ErrDuplicateIsbn
}

access registerBook {
	Manager {
		register.modify
	}
}
