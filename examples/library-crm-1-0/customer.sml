model LibraryCRM

use Std 1.0
use Gender 1.2

# Customer represents a customer profile
entity Customer {
	name          PersonName
	birthDate     Time
	email         EmailAddress
	address       Address
	gender        Gender
	borrowedBooks [Book]
	reviews       [BookReview]
}
