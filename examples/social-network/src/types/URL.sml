# URL represents a uniform resource locator
type SocialNetwork::URL

use {
	"std/regexp" 1.0
}

value Text

conversion Text as $t -> EmailAddress {
	error = select {
		case (!regexp::match(
			$t,
			/^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/,
		)) == `invalid URL ($t)`
	}
	value = $t
}
