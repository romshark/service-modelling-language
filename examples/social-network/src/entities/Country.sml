entity SocialNetwork::Country

use {
	"std" 1.0
}

properties {
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
