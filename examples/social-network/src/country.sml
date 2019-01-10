model SocialNetwork

entity Country {
	name   Text
	cities []City
}

relation CountryCities: Country <-> []City (cities, country)

access Country {
	allow public
}
