model SocialNetwork

entity City {
	country Country
	name    Text
}

access City {
	allow public
}
