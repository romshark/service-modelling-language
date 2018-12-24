model LibraryCRM

use Std 1.0

# ReturnedBookCopy represents the state of a returned book copy
struct ReturnedBookCopy {
	copy   *BookCopy
	damage []BookDamage
}

# returnBookCopies returns the given [copies] of the books to the stock
transact returnBookCopies(
	copies []*ReturnedBookCopy
) {
	returnedCopies Int
}
