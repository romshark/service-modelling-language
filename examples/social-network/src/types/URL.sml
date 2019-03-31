# URL represents a uniform resource locator
type socialNetwork::URL

use {
	"std/regexp" 1.0
}

value Text

conversion Text as $t -> EmailAddress {
	error = match {
		!regexp::match(
			$t,
			/^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/,
		) = `invalid URL ($t)`
	}
	value = $t
}
