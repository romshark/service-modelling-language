model SocialNetwork

entity Country {
	name   Text
	cities <-> []City.country as cities {
		sort desc cities.name
	}
}

access Country {
	allow public
}
