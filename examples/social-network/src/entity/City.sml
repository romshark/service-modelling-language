entity SocialNetwork::City

properties {
	country <-> Country.cities
	name    Text
}

access City {
	allow public
}
