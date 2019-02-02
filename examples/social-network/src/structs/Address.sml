struct SocialNetwork::Address

properties {
	city       -> City
	street     Text
	postalCode Text

	# details specifies any details about how to find the location specified
	details Text
}
