model LibraryCRM

use Std 1.0

# BookReview represents a book review published by a customer
entity BookReview {
	author      Customer
	rating      StarRating
	comment     Text
	publication Time
}
