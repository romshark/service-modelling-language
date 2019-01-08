model SocialNetwork

entity Country {
	name   Text
	cities []City
}

relation CountryCities: County <-> []City (cities, country)

access Country public
