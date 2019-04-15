use {
	"std" 1.0
}

entity socialNetwork::Country {
	name   socialNetwork::Text
	cities collection<City>(
		($c) => $c.country == this,
		Order::desc,
		City.name,
	)
}

access {
	allow anyone
}
