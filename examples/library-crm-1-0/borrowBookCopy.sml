model LibraryCRM

use Std 1.0

# borrowBookCopy borrows [number] of copies of the given [book] to [customer]
transact borrowBookCopy(
	customer *Customer // *Customer represents a unique identifier of a Customer
	book     *Book
	number   Int
	start    Time
	due      Time
) {
	borrowedcopy BookCopy
}

errors borrowBookCopy {
	# ErrReserved is thrown if not enough copies of the book are available
	ErrReserved
}

access borrowBookCopy {
	Customer.borrowBook: allowed
}
