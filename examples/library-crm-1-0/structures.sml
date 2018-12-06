model LibraryCRM

use Std 1.0
use Geo 1.23 as Geography // Demonstration of a namespace alias

# PersonName represents a person's name
struct PersonName {
	first Text
	last  Text
}

# BookStatistics represents interesting book statistics
struct BookStatistics {
	pages   Std.Int // we can also use explicit namespacing
	words   Int?
	letters Int?
}

struct PlaceOfBirth {
	country Geography.Country // we can also use explicit namespacing
	city    Geography.City
}

# Address represents a physical address
struct Address {
	country    Country // Country is a shortcut for Geo.Country
	city       City
	region     Region?
	street     Text
	postalCode String
}
