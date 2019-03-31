type SocialNetwork::EmailAddress

use {
	"std/regexp" 1.0
}

value Text

conversion Text as $t -> EmailAddress {
	error = match {
		!regexp::match($t, /.+@.+\..+/) = `invalid email address ($t)`
	}
	value = $t
}
