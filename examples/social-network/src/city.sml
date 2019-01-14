model SocialNetwork

entity City {
	country <-> Country.cities
	name    Text
}

access City {
	allow public
}
