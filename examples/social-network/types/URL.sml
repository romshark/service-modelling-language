use {
	"std/regexp" 1.0
}

# URL represents a uniform resource locator
type socialNetwork::URL = Text

conversion Text as $t -> EmailAddress as $v {
	$v = $t

	error = match {
		!regexp::match(
			$t,
			/^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/,
		) = `invalid URL ($t)`
	}
}
