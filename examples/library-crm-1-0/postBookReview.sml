model LibraryCRM

# postBookReview posts a new book review
transact postBookReview(
	customer *Customer
	book     *Book
	rating   StarRating
	comment  ?Text
) {
	postedReview BookReview
}

errors postBookReview {
	# ErrAlreadyReviewed is thrown when another review for book-customer
	# combination already exists
	ErrAlreadyReviewed
}

access postBookReview {
	Customer.postBookReviews allowed
}
