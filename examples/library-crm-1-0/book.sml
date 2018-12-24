model LibraryCRM

use Std 1.0

# BookCopyList represents a list of all registered copies of a book
struct BookCopyList {
	length UInt       // Int represents an unsigned integer
	items  []BookCopy
}

struct BookReviewList {
	length UInt
	items  []BookReview
}

// Override cache control for the book review list
cache BookReviewList {
	// All properties of a book review list are cachable for 10 seconds
	valid 10sec
}

# Book represents a book
entity Book {
	title         Text            // Std.Text represents unicode UTF8 texts
	description   ?Text           // The '?' represents nullable types
	tags          []Text
	isbn          String          // Std.String represents ASCII 7-bit strings
	authors       []Author        // Author is a shortcut for LibraryCRM.Author
	publication   ?Time           // Std.Time represents a RFC3339 timestamp
	cover         ?PictureFile
	reviews       BookReviewList
	averageRating ?AverageRating
	available     BookCopyList
	borrowers     []Customer
	statistics    ?BookStatistics
}

// Override cache control for the Book entity type, all properties of entity
// Book are cachable unless control is explicitly overriden
cache Book {
	// Any cached book entity is valid for 24 hours
	valid 1day
}

// Override cache control for the list of borrowers
cache Book.borrowers {
	// A cached list of borrowers is valid only for 1 minute
	valid 1min
}
