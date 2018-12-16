model LibraryCRM

use Std 1.0

# EmailAddress represents an arbitrary email address
scalar EmailAddress {
	baseType Text         // Base the new scalar type on Std.Text
	regex    /.+@.+\..+/i // Restrict text to the following regex
}

# SerialNumber represents a unique serial number of a book copy
scalar SerialNumber {
	baseType String
	length   16
}

# AverageRating represents an average rating from 1.0 (worst) to 5.0 (best)
scalar AverageRating {
	baseType Real // Base the new scalar type on Std.Real
	max      5.0  // Restrict the number to a maximum of 5.0
	min      1.0  // Restrict the number to a minimum of 1.0
}

# PictureFile represents an avatar picture file type
scalar PictureFile {
	baseType File              // File comes from Std.File
	format   JPEG | PNG | TIFF // Restrict format to either of these
	maxSize  1mib              // Restrict maximum file size to 1 MebiByte
}
