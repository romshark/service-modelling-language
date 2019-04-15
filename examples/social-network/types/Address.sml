type socialNetwork::Address = struct {
	city       City
	street     socialNetwork::Text
	postalCode socialNetwork::Text

	# details specifies any details about how to find the location specified
	details ?socialNetwork::Text
}
