model LibraryCRM

# BookCopy represents a borrowable copy of a book
entity BookCopy extends Book {
	serialNumber SerialNumber
	borrower     ?Customer
	damage       []BookDamage
}

access BookCopy public

access BookCopy.damage, BookCopy.borrower {
	Manager {
		register.view
	}
}