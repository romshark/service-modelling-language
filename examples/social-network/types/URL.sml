use {
	"std/regexp" 1.0
}

# URL represents a uniform resource locator
type socialNetwork::URL = Text

conversion Text as $t -> EmailAddress as $v {
	$v = $t
}

errors {
	Error(`invalid URL ($t)`) if
		!regexp::match(
			$t,
			/^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/,
		)
}
