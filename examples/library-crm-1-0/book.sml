model LibraryCRM

use Std 1.0

# BookCopyList represents a list of all registered copies of a book
struct BookCopyList {
	length UInt       // Int represents an unsigned integer
	items  [BookCopy]
}

struct BookReviewList {
	length UInt
	items  [BookReview]
}

# Book represents a book
entity Book {
	title         Text            // Std.Text represents unicode UTF8 texts
	description   Text?           // The '?' represents optional fields
	tags          [Text]
	isbn          String          // Std.String represents ASCII 7-bit strings
	authors       [Author]        // Author is a shortcut for LibraryCRM.Author
	publication   Time?           // Std.Time represents a RFC3339 timestamp
	cover         PictureFile?
	reviews       BookReviewList
	averageRating AverageRating?
	available     BookCopyList
	borrowers     [Customer]
	statistics    BookStatistics?
}
