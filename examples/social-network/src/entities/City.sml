entity SocialNetwork::City

use {
	"std" 1.0
}

properties {
	country Country
	name    Text
}

access City {
	allow anyone
}
