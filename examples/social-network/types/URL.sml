use {
	"std/regexp" 1.0
}

# URL represents a uniform resource locator
type socialNetwork::URL = Text

new -> ?Error = match {
	!regexp::match(
		this,
		/^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/,
	) then Error(`invalid URL ($(this))`)
}
