model LibraryCRM

use Std 1.0

# registerAuthor adds a new author profile to the register
transact registerAuthor(
	name          PersonName
	birthDate     ?Time
	placeOfBirth  ?PlaceOfBirth
	avatarPicture ?PictureFile
) {
	newAuthor Author
}

// empty error sets are ignored, but are allowed to exist
errors registerAuthor {}

access registerAuthor {
	Manager {
		register.modify
	}
}
