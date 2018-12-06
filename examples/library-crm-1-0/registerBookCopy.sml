model LibraryCRM

use Std 1.0

# registerBookCopy adds [number] of new copies of the given [book] to the
register transact registerBookCopy(
	book         *Book
	serialNumber SerialNumber
	number       Int
)

errors registerBookCopy {
	# ErrBorrowed is returned when the given book copy is currently borrowed
	ErrBorrowed
}
