entity SocialNetwork::Country

use {
	"std" 1.0
}

properties {
	name   Text
	cities <-> []City.country |> sort($, Order::Descending, City.name)
}

access Country {
	allow anyone
}
