entity SocialNetwork::Country

properties {
	name   Text
	cities <-> []City.country as cities {
		sort desc cities.name
	}
}

access Country {
	allow public
}
