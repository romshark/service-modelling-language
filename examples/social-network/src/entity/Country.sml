entity SocialNetwork::Country

properties {
	name   Text
	cities <-> []City.country |> sort desc City.name
}

access Country {
	allow public
}
