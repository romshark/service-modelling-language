type SocialNetwork::EmailAddress

use {
	"std/regexp" 1.0
}

value Text

conversion Text as $t -> EmailAddress {
	error = select {
		case (!regexp::match($t, /.+@.+\..+/)) == `invalid email address ($t)`
	}
	value = $t
}
