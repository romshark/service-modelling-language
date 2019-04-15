use {
	"std" 1.0
}

entity socialNetwork::Country {
	name   Text
	cities collection<City>(
		($c) => $c.country == this,
		Order::desc,
		City.name,
	)
}

access {
	allow anyone
}
