model LibraryCRM

# BookCopy represents a borrowable copy of a book
entity BookCopy extends Book {
	serialNumber SerialNumber
	borrower     Customer?
	damage       [BookDamage]
}
