entity SocialNetwork::City

use {
	"std" 1.0
}

properties {
	country <-> Country.cities
	name    Text
}

access City {
	allow anyone
}
