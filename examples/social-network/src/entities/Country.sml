use {
	"std" 1.0
}

entity socialNetwork::Country {
	name   Text
	cities Collection<City> {
		predicate: ($c) => $c.country == this
		order:     Order::desc
		orderBy:   City.name
	}
}

access Country {
	allow anyone
}
