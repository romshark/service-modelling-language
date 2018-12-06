model LibraryCRM

# Genre defines all book genres
enum Genre {
	SciFi
	Science
	Travel
	Fantasy
}

# StarRating represents a rating from 1 (worst) to 5 stars (best)
enum StarRating {
	# StarOne represents the worst single-star rating
	StarOne

	# StarTwo represents the a 2-star rating
	StarTwo

	# StarThree represents the a mediocre 3-star rating
	StarThree

	# StarFour represents a good 4-star rating
	StarFour

	# StarFour represents the best 5-star rating
	StarFive
}
