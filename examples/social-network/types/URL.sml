use {
	"std/regexp" 1.0
}

# URL represents a uniform resource locator
type socialNetwork::URL = Text

conversion Text as $t -> EmailAddress => $t
conversion EmailAddress as $v -> Text => $v

errors {
	Error(`invalid URL ($(this))`) if
		!regexp::match(
			this,
			/^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/,
		)
}
