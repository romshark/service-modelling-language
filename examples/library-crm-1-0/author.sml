model LibraryCRM

use Std 1.0

# Author represents a book author profile
entity Author {
	name          PersonName
	birthDate     Time?
	placeOfBirth  PlaceOfBirth?
	averageRating AverageRating?
	avatarPicture PictureFile?
	books         [Book]
}
