model LibraryCRM

use Std 1.0
use Gender 1.2

# Customer represents a customer profile
user Customer {
	name          PersonName
	birthDate     Time
	email         EmailAddress
	address       Address
	gender        Gender
	borrowedBooks [Book]
	reviews       [BookReview]
}

// Override permissions for the Customer user entity, all properties will get
// these rights applied recursively
access Customer {
	// Allow the owner to access his/her profile
	Owner // Owner is a special predefined role

	// Allow managers to access a customer profile if they have the right to
	Manager.customers: view // Allow managers to read customer
}