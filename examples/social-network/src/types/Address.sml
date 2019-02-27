type SocialNetwork::Address

use {
	"std" 1.0
}

value struct {
	city       City
	street     Text
	postalCode Text

	# details specifies any details about how to find the location specified
	details Text
}
